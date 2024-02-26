class NewsModel {
final Exhaustive? exhaustive;
final bool? exhaustiveNbHits;
final bool? exhaustiveTypo;
final List<Hits>? hits;
final int? hitsPerPage;
final int? nbHits;
final int? nbPages;
final int? page;
final String? params;
final int? processingTimeMS;
final ProcessingTimingsMS? processingTimingsMS;
final String? query;
final int? serverTimeMS;
const NewsModel({this.exhaustive , this.exhaustiveNbHits , this.exhaustiveTypo , this.hits , this.hitsPerPage , this.nbHits , this.nbPages , this.page , this.params , this.processingTimeMS , this.processingTimingsMS , this.query , this.serverTimeMS });
NewsModel copyWith({Exhaustive? exhaustive, bool? exhaustiveNbHits, bool? exhaustiveTypo, List<Hits>? hits, int? hitsPerPage, int? nbHits, int? nbPages, int? page, String? params, int? processingTimeMS, ProcessingTimingsMS? processingTimingsMS, String? query, int? serverTimeMS}){
return NewsModel(
            exhaustive:exhaustive ?? this.exhaustive,
exhaustiveNbHits:exhaustiveNbHits ?? this.exhaustiveNbHits,
exhaustiveTypo:exhaustiveTypo ?? this.exhaustiveTypo,
hits:hits ?? this.hits,
hitsPerPage:hitsPerPage ?? this.hitsPerPage,
nbHits:nbHits ?? this.nbHits,
nbPages:nbPages ?? this.nbPages,
page:page ?? this.page,
params:params ?? this.params,
processingTimeMS:processingTimeMS ?? this.processingTimeMS,
processingTimingsMS:processingTimingsMS ?? this.processingTimingsMS,
query:query ?? this.query,
serverTimeMS:serverTimeMS ?? this.serverTimeMS
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'exhaustive': exhaustive?.toJson(),
'exhaustiveNbHits': exhaustiveNbHits,
'exhaustiveTypo': exhaustiveTypo,
'hits': hits?.map<Map<String,dynamic>>((data)=> data.toJson()).toList(),
'hitsPerPage': hitsPerPage,
'nbHits': nbHits,
'nbPages': nbPages,
'page': page,
'params': params,
'processingTimeMS': processingTimeMS,
'processingTimingsMS': processingTimingsMS?.toJson(),
'query': query,
'serverTimeMS': serverTimeMS
    };
}

static NewsModel fromJson(Map<String , Object?> json){
    return NewsModel(
            exhaustive:json['exhaustive'] == null ? null : Exhaustive.fromJson(json['exhaustive']  as Map<String,Object?>),
exhaustiveNbHits:json['exhaustiveNbHits'] == null ? null : json['exhaustiveNbHits'] as bool,
exhaustiveTypo:json['exhaustiveTypo'] == null ? null : json['exhaustiveTypo'] as bool,
hits:json['hits'] == null ? null : (json['hits'] as List).map<Hits>((data)=> Hits.fromJson(data  as Map<String,Object?>)).toList(),
hitsPerPage:json['hitsPerPage'] == null ? null : json['hitsPerPage'] as int,
nbHits:json['nbHits'] == null ? null : json['nbHits'] as int,
nbPages:json['nbPages'] == null ? null : json['nbPages'] as int,
page:json['page'] == null ? null : json['page'] as int,
params:json['params'] == null ? null : json['params'] as String,
processingTimeMS:json['processingTimeMS'] == null ? null : json['processingTimeMS'] as int,
processingTimingsMS:json['processingTimingsMS'] == null ? null : ProcessingTimingsMS.fromJson(json['processingTimingsMS']  as Map<String,Object?>),
query:json['query'] == null ? null : json['query'] as String,
serverTimeMS:json['serverTimeMS'] == null ? null : json['serverTimeMS'] as int
    );
}

@override
String toString(){
    return '''NewsModel(
                exhaustive:${exhaustive.toString()},
exhaustiveNbHits:$exhaustiveNbHits,
exhaustiveTypo:$exhaustiveTypo,
hits:${hits.toString()},
hitsPerPage:$hitsPerPage,
nbHits:$nbHits,
nbPages:$nbPages,
page:$page,
params:$params,
processingTimeMS:$processingTimeMS,
processingTimingsMS:${processingTimingsMS.toString()},
query:$query,
serverTimeMS:$serverTimeMS
    ) ''';
}

@override
bool operator ==(Object other){
    return other is NewsModel && 
        other.runtimeType == runtimeType &&
        other.exhaustive == exhaustive && 
other.exhaustiveNbHits == exhaustiveNbHits && 
other.exhaustiveTypo == exhaustiveTypo && 
other.hits == hits && 
other.hitsPerPage == hitsPerPage && 
other.nbHits == nbHits && 
other.nbPages == nbPages && 
other.page == page && 
other.params == params && 
other.processingTimeMS == processingTimeMS && 
other.processingTimingsMS == processingTimingsMS && 
other.query == query && 
other.serverTimeMS == serverTimeMS;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                exhaustive, 
exhaustiveNbHits, 
exhaustiveTypo, 
hits, 
hitsPerPage, 
nbHits, 
nbPages, 
page, 
params, 
processingTimeMS, 
processingTimingsMS, 
query, 
serverTimeMS
    );
}
    
}
      
      
class ProcessingTimingsMS {
final Request? request;
final Fetch? fetch;
final int? total;
const ProcessingTimingsMS({this.request , this.fetch , this.total });
ProcessingTimingsMS copyWith({Request? request, Fetch? fetch, int? total}){
return ProcessingTimingsMS(
            request:request ?? this.request,
fetch:fetch ?? this.fetch,
total:total ?? this.total
        );
        }
        
Map<String,Object?> toJson(){
    return {
            '_request': request?.toJson(),
'fetch': fetch?.toJson(),
'total': total
    };
}

static ProcessingTimingsMS fromJson(Map<String , Object?> json){
    return ProcessingTimingsMS(
            request:json['_request'] == null ? null : Request.fromJson(json['_request']  as Map<String,Object?>),
fetch:json['fetch'] == null ? null : Fetch.fromJson(json['fetch']  as Map<String,Object?>),
total:json['total'] == null ? null : json['total'] as int
    );
}

@override
String toString(){
    return '''ProcessingTimingsMS(
                request:${request.toString()},
fetch:${fetch.toString()},
total:$total
    ) ''';
}

@override
bool operator ==(Object other){
    return other is ProcessingTimingsMS && 
        other.runtimeType == runtimeType &&
        other.request == request && 
other.fetch == fetch && 
other.total == total;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                request, 
fetch, 
total
    );
}
    
}
      
      
class Fetch {
final int? scanning;
final int? total;
const Fetch({this.scanning , this.total });
Fetch copyWith({int? scanning, int? total}){
return Fetch(
            scanning:scanning ?? this.scanning,
total:total ?? this.total
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'scanning': scanning,
'total': total
    };
}

static Fetch fromJson(Map<String , Object?> json){
    return Fetch(
            scanning:json['scanning'] == null ? null : json['scanning'] as int,
total:json['total'] == null ? null : json['total'] as int
    );
}

@override
String toString(){
    return '''Fetch(
                scanning:$scanning,
total:$total
    ) ''';
}

@override
bool operator ==(Object other){
    return other is Fetch && 
        other.runtimeType == runtimeType &&
        other.scanning == scanning && 
other.total == total;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                scanning, 
total
    );
}
    
}
      
      
class Request {
final int? roundTrip;
const Request({this.roundTrip });
Request copyWith({int? roundTrip}){
return Request(
            roundTrip:roundTrip ?? this.roundTrip
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'roundTrip': roundTrip
    };
}

static Request fromJson(Map<String , Object?> json){
    return Request(
            roundTrip:json['roundTrip'] == null ? null : json['roundTrip'] as int
    );
}

@override
String toString(){
    return '''Request(
                roundTrip:$roundTrip
    ) ''';
}

@override
bool operator ==(Object other){
    return other is Request && 
        other.runtimeType == runtimeType &&
        other.roundTrip == roundTrip;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                roundTrip
    );
}
    
}
      
      
class Hits {
final HighlightResult? highlightResult;
final List<dynamic>? tags;
final String? author;
final List<int>? children;
final String? createdAt;
final int? createdAtI;
final int? numComments;
final String? objectID;
final int? points;
final int? storyId;
final String? title;
final String? updatedAt;
final String? url;
const Hits({this.highlightResult , this.tags , this.author , this.children , this.createdAt , this.createdAtI , this.numComments , this.objectID , this.points , this.storyId , this.title , this.updatedAt , this.url });
Hits copyWith({HighlightResult? highlightResult, List<dynamic>? tags, String? author, List<int>? children, String? createdAt, int? createdAtI, int? numComments, String? objectID, int? points, int? storyId, String? title, String? updatedAt, String? url}){
return Hits(
            highlightResult:highlightResult ?? this.highlightResult,
tags:tags ?? this.tags,
author:author ?? this.author,
children:children ?? this.children,
createdAt:createdAt ?? this.createdAt,
createdAtI:createdAtI ?? this.createdAtI,
numComments:numComments ?? this.numComments,
objectID:objectID ?? this.objectID,
points:points ?? this.points,
storyId:storyId ?? this.storyId,
title:title ?? this.title,
updatedAt:updatedAt ?? this.updatedAt,
url:url ?? this.url
        );
        }
        
Map<String,Object?> toJson(){
    return {
            '_highlightResult': highlightResult?.toJson(),
'_tags': tags,
'author': author,
'children': children,
'created_at': createdAt,
'created_at_i': createdAtI,
'num_comments': numComments,
'objectID': objectID,
'points': points,
'story_id': storyId,
'title': title,
'updated_at': updatedAt,
'url': url
    };
}

static Hits fromJson(Map<String , Object?> json){
    return Hits(
            highlightResult:json['_highlightResult'] == null ? null : HighlightResult.fromJson(json['_highlightResult']  as Map<String,Object?>),
tags:json['_tags'] == null ? null : json['_tags'] as List<String>,
author:json['author'] == null ? null : json['author'] as String,
children:json['children'] == null ? null : json['children'] as List<int>,
createdAt:json['created_at'] == null ? null : json['created_at'] as String,
createdAtI:json['created_at_i'] == null ? null : json['created_at_i'] as int,
numComments:json['num_comments'] == null ? null : json['num_comments'] as int,
objectID:json['objectID'] == null ? null : json['objectID'] as String,
points:json['points'] == null ? null : json['points'] as int,
storyId:json['story_id'] == null ? null : json['story_id'] as int,
title:json['title'] == null ? null : json['title'] as String,
updatedAt:json['updated_at'] == null ? null : json['updated_at'] as String,
url:json['url'] == null ? null : json['url'] as String
    );
}

@override
String toString(){
    return '''Hits(
                highlightResult:${highlightResult.toString()},
tags:$tags,
author:$author,
children:$children,
createdAt:$createdAt,
createdAtI:$createdAtI,
numComments:$numComments,
objectID:$objectID,
points:$points,
storyId:$storyId,
title:$title,
updatedAt:$updatedAt,
url:$url
    ) ''';
}

@override
bool operator ==(Object other){
    return other is Hits && 
        other.runtimeType == runtimeType &&
        other.highlightResult == highlightResult && 
other.tags == tags && 
other.author == author && 
other.children == children && 
other.createdAt == createdAt && 
other.createdAtI == createdAtI && 
other.numComments == numComments && 
other.objectID == objectID && 
other.points == points && 
other.storyId == storyId && 
other.title == title && 
other.updatedAt == updatedAt && 
other.url == url;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                highlightResult, 
tags, 
author, 
children, 
createdAt, 
createdAtI, 
numComments, 
objectID, 
points, 
storyId, 
title, 
updatedAt, 
url
    );
}
    
}
      
      
class HighlightResult {
final Author? author;
final Author? title;
final Author? url;
const HighlightResult({this.author , this.title , this.url });
HighlightResult copyWith({Author? author, Author? title, Author? url}){
return HighlightResult(
            author:author ?? this.author,
title:title ?? this.title,
url:url ?? this.url
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'author': author?.toJson(),
'title': title?.toJson(),
'url': url?.toJson()
    };
}

static HighlightResult fromJson(Map<String , Object?> json){
    return HighlightResult(
            author:json['author'] == null ? null : Author.fromJson(json['author']  as Map<String,Object?>),
title:json['title'] == null ? null : Author.fromJson(json['title']  as Map<String,Object?>),
url:json['url'] == null ? null : Author.fromJson(json['url']  as Map<String,Object?>)
    );
}

@override
String toString(){
    return '''HighlightResult(
                author:${author.toString()},
title:${title.toString()},
url:${url.toString()}
    ) ''';
}

@override
bool operator ==(Object other){
    return other is HighlightResult && 
        other.runtimeType == runtimeType &&
        other.author == author && 
other.title == title && 
other.url == url;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                author, 
title, 
url
    );
}
    
}
      
      
class Author {
final String? matchLevel;
final List<dynamic>? matchedWords;
final String? value;
const Author({this.matchLevel , this.matchedWords , this.value });
Author copyWith({String? matchLevel, List<dynamic>? matchedWords, String? value}){
return Author(
            matchLevel:matchLevel ?? this.matchLevel,
matchedWords:matchedWords ?? this.matchedWords,
value:value ?? this.value
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'matchLevel': matchLevel,
'matchedWords': matchedWords,
'value': value
    };
}

static Author fromJson(Map<String , Object?> json){
    return Author(
            matchLevel:json['matchLevel'] == null ? null : json['matchLevel'] as String,
matchedWords:json['matchedWords'] == null ? null : json['matchedWords'] as List<dynamic>,
value:json['value'] == null ? null : json['value'] as String
    );
}

@override
String toString(){
    return '''Author(
                matchLevel:$matchLevel,
matchedWords:$matchedWords,
value:$value
    ) ''';
}

@override
bool operator ==(Object other){
    return other is Author && 
        other.runtimeType == runtimeType &&
        other.matchLevel == matchLevel && 
other.matchedWords == matchedWords && 
other.value == value;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                matchLevel, 
matchedWords, 
value
    );
}
    
}
      
      
class Exhaustive {
final bool? nbHits;
final bool? typo;
const Exhaustive({this.nbHits , this.typo });
Exhaustive copyWith({bool? nbHits, bool? typo}){
return Exhaustive(
            nbHits:nbHits ?? this.nbHits,
typo:typo ?? this.typo
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'nbHits': nbHits,
'typo': typo
    };
}

static Exhaustive fromJson(Map<String , Object?> json){
    return Exhaustive(
            nbHits:json['nbHits'] == null ? null : json['nbHits'] as bool,
typo:json['typo'] == null ? null : json['typo'] as bool
    );
}

@override
String toString(){
    return '''Exhaustive(
                nbHits:$nbHits,
typo:$typo
    ) ''';
}

@override
bool operator ==(Object other){
    return other is Exhaustive && 
        other.runtimeType == runtimeType &&
        other.nbHits == nbHits && 
other.typo == typo;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                nbHits, 
typo
    );
}
    
}
      
      
  
     