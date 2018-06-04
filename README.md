As a website user,
So I can see what pages I've bookmarked
I want to see a list of bookmarks

```puml
User->BookmarkApp: ShowList
BookmarkApp->Database: ReturnList
Database-->BookmarkApp: List
BookmarkApp-->User: FormattedList
```

As a website user,
So that I can record addresses of pages I visit
I want to add new bookmarks

```puml
User->BookmarkApp: AddPage
BookmarkApp->Database: Page
BookmarkApp-->User: PageAdded
```

As a website user,
So that I can remove unwanted bookmarks
I would like to delete a bookmark

```puml
User->BookmarkApp: DeletePage
BookmarkApp->Database: DeletePage
BookmarkApp-->User: PageDeleted
```

As a website user,
So that I can keep information for bookmarked pages up to date
I would like to update bookmarks

```puml
User->BookmarkApp: UpdateBookmarks
BookmarkApp->Database: UpdateBookmarks
BookmarkApp-->User: BookmarksUpdated
```

As a website user,
So that I can store my thoughts about web pages
I would like to comment on links

```puml
User->BookmarkApp: AddComment
BookmarkApp->Database: AddComment
BookmarkApp-->User: CommentStored
```

As a website user,
So that I can categorise my bookmarks
I would like to add a tag to a bookmark

```puml
User->BookmarkApp: AddTag
BookmarkApp->Database: AddTag
BookmarkApp-->User: TagStored
```

As a website user,
So I can see all bookmarks in a certain category
I would like to filter bookmarks by tag

```puml
User->BookmarkApp: Filter(byTag)
BookmarkApp->Database: ReturnFilteredList(byTag)
Database-->BookmarkApp: FilteredList
BookmarkApp-->User: FormattedFilteredList
```

As a website user,
So that I can keep an up-to-date list of bookmarked sites
I would like to manage my bookmarks
--> This user story is satisfied by the aggregate of the domain models above 
