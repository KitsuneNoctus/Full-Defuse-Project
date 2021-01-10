//
//  NotesViewController.swift
//  Defuse2
//
//  Created by Henry Calderon on 1/7/21.
//

import UIKit
import CoreData

class NotesViewController: UIViewController {
    
    var coreDataStack = CoreDataStack()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = 50
        table.backgroundColor = .clear
        return table
    }()
    
    //MARK: Fetch Controller
    lazy var fetchedResultsController: NSFetchedResultsController<Note> = {

        let fetchRequest: NSFetchRequest<Note> = Note.fetchRequest()
        
        fetchRequest.sortDescriptors = []

        let fetchedResultsController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: coreDataStack.managedContext,
            sectionNameKeyPath: nil,
            cacheName: nil)

        fetchedResultsController.delegate = self

        return fetchedResultsController
    }()
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Notes"
//        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = editButtonItem
        self.navigationController?.navigationBar.isHidden = false
        setup()
        fetchResults()
    }
    
    //MARK: View Will Appear
    override func viewWillAppear(_ animated: Bool) {
        fetchResults()
        tableView.reloadData()
    }
    
    //MARK: Fetch Results
    func fetchResults(){
        do {
          try fetchedResultsController.performFetch()
        } catch {
          print(error)
        }
    }
    
    //MARK: Setup
    func setup(){
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    //MARK: Show Editing
    @objc func showEditing(sender: UIBarButtonItem){
        if(self.tableView.isEditing == true){
            self.tableView.isEditing = false
            self.navigationItem.rightBarButtonItem?.title = "Edit"
        }
        else
        {
            self.tableView.isEditing = true
            self.navigationItem.rightBarButtonItem?.title = "Done"
        }
    }

}

//MARK: Extension - Table View Delegate & Data Source
extension NotesViewController: UITableViewDelegate, UITableViewDataSource{
    /// Number of Sections
    func numberOfSections(in tableView: UITableView) -> Int {
      //sections
      return fetchedResultsController.sections?.count ?? 0
    }
    
    ///Number of Rows in Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionInfo =
            fetchedResultsController.sections?[section] else {
                return 0
        }
        return sectionInfo.numberOfObjects
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let note = fetchedResultsController.object(at: indexPath)
        cell.textLabel?.text = note.title
        return cell
    }
    
    //MARK: Did select row at
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.isEditing == true{
            let note = fetchedResultsController.object(at: indexPath)
            let NewVC = NewNoteViewController()
            self.navigationController?.pushViewController(NewVC, animated: true)
        }else{
            let cell = tableView.cellForRow(at: indexPath)
            let vc = NoteViewController()
            let project = fetchedResultsController.object(at: indexPath)
            vc.prompt = project.prompt ?? "Prompt"
            vc.titleName = project.title ?? "Note"
            vc.body = project.body
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    ///- -------------------------------
    private func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
          return true
    }
    
    override func setEditing(_ editing: Bool, animated: Bool){
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            coreDataStack.managedContext.delete(fetchedResultsController.object(at: indexPath))
            coreDataStack.saveContext()
        }
    }
    
    
}

//MARK: Extension - Fetch Results Delegate
extension NotesViewController: NSFetchedResultsControllerDelegate{
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
      tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                    didChange anObject: Any,
                    at indexPath: IndexPath?,
                    for type: NSFetchedResultsChangeType,
                    newIndexPath: IndexPath?) {
      
      switch type {
      case .insert:
        tableView.insertRows(at: [newIndexPath!], with: .automatic)
      case .delete:
        tableView.deleteRows(at: [indexPath!], with: .automatic)
      case .update:
        let cell = tableView.cellForRow(at: indexPath!)!
        let note = fetchedResultsController.object(at: indexPath!)
        cell.textLabel?.text = note.title
      case .move:
        tableView.deleteRows(at: [indexPath!], with: .automatic)
        tableView.insertRows(at: [newIndexPath!], with: .automatic)
      }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
      tableView.endUpdates()
    }
}
