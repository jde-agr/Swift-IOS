//
//  article.swift
//  jdeagr2019
//
//  Created by jasmine DE-AGRELA on 2019/10/18.
//

import Foundation
import CoreData

class Article: NSManagedObject {
    @NSManaged var Title: String?
    @NSManaged var Content: String?
    @NSManaged var Language: String?
    @NSManaged var Image: NSData?
    @NSManaged var CreationDate: NSDate?
    @NSManaged var ModificationDate: NSDate?
    
    override var description: String {
        return "\(self.Title!)\n\(self.Content!)"
    }
}

@available(iOS 10.0, *)
public class ArticleManager {
    public init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
       let container = NSPersistentContainer(name: "jdeagr2019")
        
        container.loadPersistentStores(completionHandler: { (_, error) in
            guard let error = error as NSError? else { return }
            fatalError("Unresolved error: \(error), \(error.userInfo)")
        })
        
        return container
    }()
    
    public func newArticle(title: String, content: String) {
        print("Ywa")
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        print(managedContext)
        
        //Now let's create an entity and new user records.
        let userEntity = NSEntityDescription.entity(forEntityName: "Article", in: managedContext)!
        
        //final, we need to add some data to our newly created record for each keys using
        
            let articles = NSManagedObject(entity: userEntity, insertInto: managedContext)
            articles.setValue("Hello", forKeyPath: "title")
            articles.setValue("Goodbye", forKey: "content")
    //        articles.setValue("\(language)", forKey: "language")
    //        articles.setValue("\(image)", forKey: "image")
    //        articles.setValue("\(creationDate)", forKey: "creationDate")
    //        articles.setValue("\(modificationDate)", forKey: "modificationDate")
        
        //Now we have set all the values. The next step is to save them inside the Core Data
        
        do {
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        print (articles.description)
    }
}
