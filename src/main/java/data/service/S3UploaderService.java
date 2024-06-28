package data.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class S3UploaderService {
    private final AmazonS3 amazonS3;
    private final String bucket;

    // 생성자
    public S3UploaderService(AmazonS3 amazonS3, @Value("${cloud.aws.s3.bucket}") String bucket) {
        this.amazonS3 = amazonS3;
        this.bucket = bucket;
    }

    // 파일 업로드 메서드
    public String upload(MultipartFile multipartFile, String dirName) throws IOException {
        String originalFileName = multipartFile.getOriginalFilename();

        String uuid = UUID.randomUUID().toString();
     
        String uniqueFileName = uuid + "_" + originalFileName.replaceAll("\\s", "_");

        String fileName = dirName + "/" + uniqueFileName;
        log.info("fileName: " + fileName);
        File uploadFile = convert(multipartFile);

        String uploadImageUrl = putS3(uploadFile, fileName);
        removeNewFile(uploadFile);
        return uploadImageUrl;
    }

    // MultipartFile을 File로 변환하는 메서드
    private File convert(MultipartFile file) throws IOException {
        String originalFileName = file.getOriginalFilename();
        String uuid = UUID.randomUUID().toString();
        String uniqueFileName = uuid + "_" + originalFileName.replaceAll("\\s", "_");

        File convertFile = new File(uniqueFileName);
        if (convertFile.createNewFile()) {
            try (FileOutputStream fos = new FileOutputStream(convertFile)) {
                fos.write(file.getBytes());
            } catch (IOException e) {
                log.error("파일 변환 중 오류 발생: {}", e.getMessage());
                throw e;
            }
            return convertFile;
        }
        throw new IllegalArgumentException(String.format("파일 변환에 실패했습니다. %s", originalFileName));
    }

    // 파일을 S3에 업로드하는 메서드
    private String putS3(File uploadFile, String fileName) {
        amazonS3.putObject(new PutObjectRequest(bucket, fileName, uploadFile)
                .withCannedAcl(CannedAccessControlList.PublicRead));
        return amazonS3.getUrl(bucket, fileName).toString();
    }

    // 로컬에 저장된 파일을 삭제하는 메서드
    private void removeNewFile(File targetFile) {
        if (targetFile.delete()) {
            log.info("파일이 삭제되었습니다.");
        } else {
            log.info("파일이 삭제되지 못했습니다.");
        }
    }

    // S3에서 파일을 삭제하는 메서드
    public void deleteFile(String fileName) {
        try {
            String decodedFileName = URLDecoder.decode(fileName, "UTF-8");
            log.info("Deleting file from S3: " + decodedFileName);
            amazonS3.deleteObject(bucket, decodedFileName);
        } catch (UnsupportedEncodingException e) {
            log.error("Error while decoding the file name: {}", e.getMessage());
        }
    }

    // 파일을 업데이트하는 메서드
    public String updateFile(MultipartFile newFile, String oldFileName, String dirName) throws IOException {
        log.info("S3 oldFileName: " + oldFileName);
        deleteFile(oldFileName);
        return upload(newFile, dirName);
    }
    public String uploadSingleFile(MultipartFile file,String dirName) throws IOException{
    	  	
    		String originalFileName = file.getOriginalFilename();
    	    String uuid = UUID.randomUUID().toString();
    	    String uniqueFileName = uuid + "_" + originalFileName.replaceAll("\\s", "_");

    	    String fileName = dirName + "/" + uniqueFileName;
    	    log.info("SingleFileName: " + fileName);

    	    File uploadFile = convert(file);
    	    String uploadImageUrl = putS3(uploadFile, fileName);
    	    removeNewFile(uploadFile);

    	    return uploadImageUrl;
    }
}