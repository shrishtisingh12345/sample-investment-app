//
//  chatViewController.swift
//  Sample-Finance-Planner
//
//  Created by Apple on 4/27/22.
//

import UIKit
import MessageKit
import InputBarAccessoryView

struct sender:SenderType{
    var senderId: String
    var displayName: String
}

struct Message:MessageType{
    var sender: SenderType
    var messageId: Int
    var sentDate: Date
    var kind: MessageKind
    }


class ChatViewController: MessagesViewController,MessagesDataSource,MessagesLayoutDelegate,MessagesDisplayDelegate, InputBarAccessoryViewDelegate {
    
  
    let currentUser = sender(senderId: "self", displayName: "UserOne")
    let secondUser = sender(senderId: "Second", displayName: "Unknown")
    var messages = [MessageType]()
    
        
    
    @IBOutlet weak var chatTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.delegate = self
        messagesCollectionView.delegate = self as InputBarAccessoryViewDelegate as? UICollectionViewDelegate
        
        messages.append(Message(sender: currentUser, messageId: 1, sentDate: Date().addingTimeInterval(-8600), kind: .text("Hellow")))
        
        messages.append(Message(sender: currentUser, messageId: 2, sentDate: Date().addingTimeInterval(-70000), kind: .text("How May I help You")))
        
        messages.append(Message(sender: secondUser, messageId: 3, sentDate: Date().addingTimeInterval(-60000), kind: .text("I need fuggestion for my investment")))
        
//        messages.append(Message(sender: currentUser, messageId: 4, sentDate: Date().addingTimeInterval(-40000), kind: .text("what is this going on")))
//        
//        messages.append(Message(sender: secondUser, messageId: 6, sentDate: Date().addingTimeInterval(-20000), kind: .text("here is a long reply")))
//        
//        messages.append(Message(sender: secondUser, messageId: 7, sentDate: Date().addingTimeInterval(-10000), kind: .text("look its work")))
//        messages.append(Message(sender: currentUser, messageId: 8, sentDate: Date().addingTimeInterval(-10000), kind: .text("hi shashank")))
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
      
       
    }
    
    func currentSender() -> SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        messages.count
    }
    
 
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        print("New Message")
        for message in messages {
            messages.append(Message(sender: currentUser, messageId: 1, sentDate: Date().addingTimeInterval(-58999), kind: .text(inputBar.inputTextView.text)))
            messagesCollectionView.reloadData()
            inputBar.inputTextView.text = ""
           return
        }
        messagesCollectionView.reloadData()
        inputBar.inputTextView.text = ""
    }
    
    func inputBar(_ inputBar: InputBarAccessoryView, didChangeIntrinsicContentTo size: CGSize) {
        print("2")
    }
    
//    func inputBar(_ inputBar: InputBarAccessoryView, textViewTextDidChangeTo text: String) {
//        print("3")
//       
//    }
    
    func inputBar(_ inputBar: InputBarAccessoryView, didSwipeTextViewWith gesture: UISwipeGestureRecognizer) {
        print("4")
    }
    
    
}

