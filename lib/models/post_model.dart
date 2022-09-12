import 'dart:convert';

PostData postFromJson(String str) => PostData.fromJson(json.decode(str));

class PostData {
  PostData({
    this.after,
    this.dist,
    this.modhash,
    this.geoFilter,
    this.children,
    this.before,
  });

  dynamic after;
  num? dist;
  String? modhash;
  String? geoFilter;
  List<Child>? children;
  String? before;

  factory PostData.fromJson(Map<String, dynamic> json) => PostData(
        after: json["after"],
        dist: json["dist"],
        modhash: json["modhash"],
        geoFilter: json["geo_filter"],
        children:
            List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
        before: json["before"],
      );
}

class Child {
  Child({
    required this.kind,
    required this.data,
  });

  String kind;
  ChildData data;

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        kind: json["kind"],
        data: ChildData.fromJson(json["data"]),
      );
}

class ChildData {
  ChildData({
    this.approvedAtUtc,
    this.subreddit,
    this.selftext,
    required this.authorFullname,
    this.saved,
    this.modReasonTitle,
    this.gilded,
    this.clicked,
    this.title,
    this.linkFlairRichtext,
    this.subredditNamePrefixed,
    this.hidden,
    this.pwls,
    this.linkFlairCssClass,
    this.downs,
    this.thumbnailHeight,
    this.topAwardedType,
    this.hideScore,
    this.name,
    this.quarantine,
    this.linkFlairTextColor,
    this.upvoteRatio,
    this.authorFlairBackgroundColor,
    this.subredditType,
    this.ups,
    this.totalAwardsReceived,
    this.thumbnailWidth,
    this.authorFlairTemplateId,
    this.isOriginalContent,
    this.userReports,
    this.isRedditMediaDomain,
    this.isMeta,
    this.category,
    this.linkFlairText,
    this.canModPost,
    this.score,
    this.approvedBy,
    this.isCreatedFromAdsUi,
    this.authorPremium,
    this.thumbnail,
    this.edited,
    this.authorFlairCssClass,
    this.authorFlairRichtext,
    this.postHnum,
    this.contentCategories,
    this.isSelf,
    this.modNote,
    this.created,
    this.linkFlairType,
    this.wls,
    this.removedByCategory,
    this.bannedBy,
    this.authorFlairType,
    this.domain,
    this.allowLiveComments,
    this.selftextHtml,
    this.likes,
    this.suggestedSort,
    this.bannedAtUtc,
    this.viewCount,
    this.archived,
    this.noFollow,
    this.isCrosspostable,
    this.pinned,
    this.over18,
    this.preview,
    this.allAwardings,
    this.awarders,
    this.mediaOnly,
    this.linkFlairTemplateId,
    this.canGild,
    this.spoiler,
    this.locked,
    this.authorFlairText,
    this.treatmentTags,
    this.visited,
    this.removedBy,
    this.numReports,
    this.distinguished,
    this.subredditId,
    this.authorIsBlocked,
    this.modReasonBy,
    this.removalReason,
    this.linkFlairBackgroundColor,
    this.id,
    this.isRobotIndexable,
    this.reportReasons,
    required this.author,
    this.discussionType,
    this.numComments,
    this.sendReplies,
    this.whitelistStatus,
    this.contestMode,
    this.modReports,
    this.authorPatreonFlair,
    this.authorFlairTextColor,
    this.permalink,
    this.parentWhitelistStatus,
    this.stickied,
    this.url,
    this.subredditSubscribers,
    required this.createdUtc,
    this.numCrossposts,
    this.isVideo,
    this.urlOverriddenByDest,
  });

  dynamic approvedAtUtc;
  String? subreddit;
  String? selftext;
  String authorFullname;
  bool? saved;
  dynamic modReasonTitle;
  num? gilded;
  bool? clicked;
  String? title;
  List<dynamic>? linkFlairRichtext;
  String? subredditNamePrefixed;
  bool? hidden;
  num? pwls;
  String? linkFlairCssClass;
  num? downs;
  num? thumbnailHeight;
  dynamic topAwardedType;
  bool? hideScore;
  String? name;
  bool? quarantine;
  String? linkFlairTextColor;
  double? upvoteRatio;
  String? authorFlairBackgroundColor;
  String? subredditType;
  num? ups;
  num? totalAwardsReceived;
  num? thumbnailWidth;
  dynamic authorFlairTemplateId;
  bool? isOriginalContent;
  List<dynamic>? userReports;
  bool? isRedditMediaDomain;
  bool? isMeta;
  dynamic category;
  String? linkFlairText;
  bool? canModPost;
  num? score;
  dynamic approvedBy;
  bool? isCreatedFromAdsUi;
  bool? authorPremium;
  String? thumbnail;
  dynamic edited;
  String? authorFlairCssClass;
  List<dynamic>? authorFlairRichtext;
  String? postHnum;
  dynamic contentCategories;
  bool? isSelf;
  dynamic modNote;
  num? created;
  String? linkFlairType;
  num? wls;
  dynamic removedByCategory;
  dynamic bannedBy;
  String? authorFlairType;
  String? domain;
  bool? allowLiveComments;
  String? selftextHtml;
  dynamic likes;
  dynamic suggestedSort;
  dynamic bannedAtUtc;
  dynamic viewCount;
  bool? archived;
  bool? noFollow;
  bool? isCrosspostable;
  bool? pinned;
  bool? over18;
  Preview? preview;
  List<dynamic>? allAwardings;
  List<dynamic>? awarders;
  bool? mediaOnly;
  String? linkFlairTemplateId;
  bool? canGild;
  bool? spoiler;
  bool? locked;
  String? authorFlairText;
  List<dynamic>? treatmentTags;
  bool? visited;
  dynamic removedBy;
  dynamic numReports;
  dynamic distinguished;
  String? subredditId;
  bool? authorIsBlocked;
  dynamic modReasonBy;
  dynamic removalReason;
  String? linkFlairBackgroundColor;
  String? id;
  bool? isRobotIndexable;
  dynamic reportReasons;
  String author;
  dynamic discussionType;
  num? numComments;
  bool? sendReplies;
  String? whitelistStatus;
  bool? contestMode;
  List<dynamic>? modReports;
  bool? authorPatreonFlair;
  String? authorFlairTextColor;
  String? permalink;
  String? parentWhitelistStatus;
  bool? stickied;
  String? url;
  num? subredditSubscribers;
  num createdUtc;
  num? numCrossposts;
  bool? isVideo;
  String? urlOverriddenByDest;

  factory ChildData.fromJson(Map<String, dynamic> json) => ChildData(
        approvedAtUtc: json["approved_at_utc"],
        subreddit: json["subreddit"],
        selftext: json["selftext"],
        authorFullname: json["author_fullname"],
        saved: json["saved"],
        modReasonTitle: json["mod_reason_title"],
        gilded: json["gilded"],
        clicked: json["clicked"],
        title: json["title"],
        linkFlairRichtext:
            List<dynamic>.from(json["link_flair_richtext"].map((x) => x)),
        subredditNamePrefixed: json["subreddit_name_prefixed"],
        hidden: json["hidden"],
        pwls: json["pwls"],
        linkFlairCssClass: json["link_flair_css_class"],
        downs: json["downs"],
        thumbnailHeight: json["thumbnail_height"],
        topAwardedType: json["top_awarded_type"],
        hideScore: json["hide_score"],
        name: json["name"],
        quarantine: json["quarantine"],
        linkFlairTextColor: json["link_flair_text_color"],
        upvoteRatio: json["upvote_ratio"].toDouble(),
        authorFlairBackgroundColor: json["author_flair_background_color"],
        subredditType: json["subreddit_type"],
        ups: json["ups"],
        totalAwardsReceived: json["total_awards_received"],
        thumbnailWidth: json["thumbnail_width"],
        authorFlairTemplateId: json["author_flair_template_id"],
        isOriginalContent: json["is_original_content"],
        userReports: List<dynamic>.from(json["user_reports"].map((x) => x)),
        isRedditMediaDomain: json["is_reddit_media_domain"],
        isMeta: json["is_meta"],
        category: json["category"],
        linkFlairText: json["link_flair_text"],
        canModPost: json["can_mod_post"],
        score: json["score"],
        approvedBy: json["approved_by"],
        isCreatedFromAdsUi: json["is_created_from_ads_ui"],
        authorPremium: json["author_premium"],
        thumbnail: json["thumbnail"],
        edited: json["edited"],
        authorFlairCssClass: json["author_flair_css_class"],
        authorFlairRichtext:
            List<dynamic>.from(json["author_flair_richtext"].map((x) => x)),
        postHnum: json["post_hnum"],
        contentCategories: json["content_categories"],
        isSelf: json["is_self"],
        modNote: json["mod_note"],
        created: json["created"],
        linkFlairType: json["link_flair_type"],
        wls: json["wls"],
        removedByCategory: json["removed_by_category"],
        bannedBy: json["banned_by"],
        authorFlairType: json["author_flair_type"],
        domain: json["domain"],
        allowLiveComments: json["allow_live_comments"],
        selftextHtml: json["selftext_html"],
        likes: json["likes"],
        suggestedSort: json["suggested_sort"],
        bannedAtUtc: json["banned_at_utc"],
        viewCount: json["view_count"],
        archived: json["archived"],
        noFollow: json["no_follow"],
        isCrosspostable: json["is_crosspostable"],
        pinned: json["pinned"],
        over18: json["over_18"],
        preview:
            json["preview"] == null ? null : Preview.fromJson(json["preview"]),
        allAwardings: List<dynamic>.from(json["all_awardings"].map((x) => x)),
        awarders: List<dynamic>.from(json["awarders"].map((x) => x)),
        mediaOnly: json["media_only"],
        linkFlairTemplateId: json["link_flair_template_id"],
        canGild: json["can_gild"],
        spoiler: json["spoiler"],
        locked: json["locked"],
        authorFlairText: json["author_flair_text"],
        treatmentTags: List<dynamic>.from(json["treatment_tags"].map((x) => x)),
        visited: json["visited"],
        removedBy: json["removed_by"],
        numReports: json["num_reports"],
        distinguished: json["distinguished"],
        subredditId: json["subreddit_id"],
        authorIsBlocked: json["author_is_blocked"],
        modReasonBy: json["mod_reason_by"],
        removalReason: json["removal_reason"],
        linkFlairBackgroundColor: json["link_flair_background_color"],
        id: json["id"],
        isRobotIndexable: json["is_robot_indexable"],
        reportReasons: json["report_reasons"],
        author: json["author"],
        discussionType: json["discussion_type"],
        numComments: json["num_comments"],
        sendReplies: json["send_replies"],
        whitelistStatus: json["whitelist_status"],
        contestMode: json["contest_mode"],
        modReports: List<dynamic>.from(json["mod_reports"].map((x) => x)),
        authorPatreonFlair: json["author_patreon_flair"],
        authorFlairTextColor: json["author_flair_text_color"],
        permalink: json["permalink"],
        parentWhitelistStatus: json["parent_whitelist_status"],
        stickied: json["stickied"],
        url: json["url"],
        subredditSubscribers: json["subreddit_subscribers"],
        createdUtc: json["created_utc"],
        numCrossposts: json["num_crossposts"],
        isVideo: json["is_video"],
        urlOverriddenByDest: json["url_overridden_by_dest"],
      );
}

class Preview {
  Preview({
    required this.images,
    this.enabled,
  });

  List<Img> images;
  bool? enabled;

  factory Preview.fromJson(Map<String, dynamic> json) => Preview(
        images: List<Img>.from(json["images"].map((x) => Img.fromJson(x))),
        enabled: json["enabled"],
      );
}

class Img {
  Img({
    required this.source,
    this.resolutions,
    this.id,
  });

  Source source;
  List<Source>? resolutions;
  String? id;

  factory Img.fromJson(Map<String, dynamic> json) => Img(
        source: Source.fromJson(json["source"]),
        resolutions: List<Source>.from(
            json["resolutions"].map((x) => Source.fromJson(x))),
        id: json["id"],
      );
}

class Source {
  Source({
    required this.url,
    this.width,
    this.height,
  });

  String url;
  num? width;
  num? height;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );
}
