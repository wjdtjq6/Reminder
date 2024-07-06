//
//  FileManager+Extension.swift
//  Reminder
//
//  Created by t2023-m0032 on 7/6/24.
//

import UIKit

extension UIViewController {
    func removeImageFromDocument(filename: String) {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileUrl = documentDirectory.appendingPathComponent("\(filename).jpg")
        
        if FileManager.default.fileExists(atPath: fileUrl.path()) {
            do {
                try FileManager.default.removeItem(atPath: fileUrl.path())
            } catch {
                print("file remove error", error)
            }
        }
        else {
            print("file no exist")
        }
    }
    func loadImageToDocumnet(filename: String) -> UIImage? {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileUrl = documentDirectory.appendingPathComponent("\(filename).jpg")
        //이 경로에 실제로 파일이 존재하는 지 확인
        if FileManager.default.fileExists(atPath: fileUrl.path()) {
            return UIImage(contentsOfFile: fileUrl.path())
        } else {
            return nil//UIImage(systemName: "star.fill")
        }
    }
    func saveImageToDocument(image: UIImage, filename: String) {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        //이미지를 저장할 경로(파일명) 지정
        let fileUrl = documentDirectory.appendingPathComponent("\(filename).jpg")
        //이미지 압축
        guard let data = image.jpegData(compressionQuality: 0.5) else { return }
        //이미지 파일 저장
        do {
            try data.write(to: fileUrl)
        } catch {
            print("file save error", error)
        }
    }
}
