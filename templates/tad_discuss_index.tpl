<{$toolbar}>

<{if $all_content}>
  <{$FooTableJS}>
  <table class="table table-hover">
  <thead>
  <tr>
    <th data-hide="phone"></th>
    <th data-class="expand"></th>
    <th data-hide="phone"></th>
    <th data-hide="phone"></th>
  </tr>
  </thead>

  <{foreach item=bb from=$all_content}>
    <tbody>
      <tr style="background-color:#f0f0f0;">
        <td style="vertical-align:top;width:100px;">
          <div style="width:90px;height:60px;background: transparent url(<{$bb.pic}>) no-repeat center top;-moz-border-radius: 5px;-khtml-border-radius: 5px;-webkit-border-radius: 5px;border-radius: 5px;position:relative;float:right;background-size: contain;" alt="<{$bb.BoardTitle}>" title="<{$bb.BoardTitle}>"></div>
        </td>
        <td colspan=4>
          <{if $bb.post}>
            <a href="discuss.php?op=tad_discuss_form&BoardID=<{$bb.BoardID}>" style="float:right;" class="btn btn-info"><{$smarty.const._MD_TADDISCUS_ADD_DISCUSS}></a>
          <{/if}>
          <a href="discuss.php?BoardID=<{$bb.BoardID}>" style="font-size:130%"><{$bb.BoardTitle}></a> <{$bb.fun}>
          <div style="margin:10px auto;font-size:12px;">
            <img src="images/add.png" align="absmiddle" hspace=4 alt="<{$bb.BoardNum}>"><{$bb.BoardNum}> / <img src="images/add.png" align="absmiddle" hspace=4 alt="<{$bb.DiscussNum}>"><{$bb.DiscussNum}>  / <span style="font-size:11px;"><img src="images/cup.png" align="absmiddle" hspace=4 alt="<{$bb.BoardManager}>"><{$smarty.const._MD_TADDISCUS_BOARDMANAGER}><{$smarty.const._TAD_FOR}><{$bb.BoardManager}></span>
          </div>
        </td>
      </tr>
      <{if $bb.list_tad_discuss}>
        <{foreach item=discuss from=$bb.list_tad_discuss}>
          <tr>
            <td></td>
            <td>
              <span nowrap style="font-size:11px;color:#8BA0A6"><{$discuss.LastTime}></span>
              <a href="discuss.php?DiscussID=<{$discuss.DiscussID}>&BoardID=<{$discuss.BoardID}>"><{$discuss.DiscussTitle}></a></td>
            <td class="text-right;"><{$discuss.uid_name}></td>
            <td class="text-center"><{$discuss.renum}></td>
          </tr>
        <{/foreach}>
      <{elseif $login}>
        <tr>
          <td colspan=4 style="border:none;text-align:right;">
            <a href="discuss.php?op=tad_discuss_form&BoardID=<{$bb.BoardID}>">
              <img src="images/add.png" align="absmiddle" hspace=4 alt="<{$smarty.const._MD_TADDISCUS_ADD_DISCUSS}>">
              <{$smarty.const._MD_TADDISCUS_DISCUSS_EMPTY}>
            </a>
          </td>
        </tr>
      <{else}>
        <tr>
          <td colspan=4 style="border:none;text-align:right;">
            <{$smarty.const._MD_TADDISCUS_DISCUSS_EMPTY}>
          </td>
        </tr>
      <{/if}>

      <!--子分類-->
      <{if $bb.subBoard}>
        <{foreach item=subBoard from=$bb.subBoard}>
          <tr style="background-color:#f9f9f9;">
            <td style="vertical-align:top;width:100px;">
              <div style="width:60px;height:40px;background: transparent url(<{$subBoard.pic}>) no-repeat center top;-moz-border-radius: 5px;-khtml-border-radius: 5px;-webkit-border-radius: 5px;border-radius: 5px;position:relative;float:right;background-size: contain;" alt="<{$subBoard.BoardTitle}>" title="<{$subBoard.BoardTitle}>"></div>
            </td>
            <td colspan=4>

              <{if $subBoard.post}>
                <a href="discuss.php?op=tad_discuss_form&BoardID=<{$subBoard.BoardID}>" style="float:right;" class="btn btn-sm btn-info"><{$smarty.const._MD_TADDISCUS_ADD_DISCUSS}></a>
              <{/if}>
              <div style="margin:10px auto;font-size:12px;">
                <a href="discuss.php?BoardID=<{$subBoard.BoardID}>" style="font-size:110%;font-weight:bold;"><{$subBoard.BoardTitle}></a> <{$subBoard.fun}>
                <img src="images/add.png" align="absmiddle" hspace=4 alt="<{$subBoard.BoardNum}>"><{$subBoard.BoardNum}> / <img src="images/add.png" align="absmiddle" hspace=4 alt="<{$subBoard.DiscussNum}>"><{$subBoard.DiscussNum}>  / <span style="font-size:11px;"><img src="images/cup.png" align="absmiddle" hspace=4 alt="<{$subBoard.BoardManager}>"><{$smarty.const._MD_TADDISCUS_BOARDMANAGER}><{$smarty.const._TAD_FOR}><{$subBoard.BoardManager}></span>
              </div>
            </td>
          </tr>
          <{if $subBoard.list_tad_discuss}>
            <{foreach item=discuss from=$subBoard.list_tad_discuss}>
              <tr>
                <td></td>
                <td>
                  <span nowrap style="font-size:11px;color:#8BA0A6"><{$discuss.LastTime}></span>
                  <a href="discuss.php?DiscussID=<{$discuss.DiscussID}>&BoardID=<{$discuss.BoardID}>"><{$discuss.DiscussTitle}></a></td>
                <td class="text-right;"><{$discuss.uid_name}></td>
                <td class="text-center"><{$discuss.renum}></td>
              </tr>
            <{/foreach}>
          <{/if}>
        <{/foreach}>
      <{/if}>
    </tbody>
  <{/foreach}>
  </table>
<{else}>

  <div class="jumbotron">
    <a href="admin/main.php?op=tad_discuss_board_form"><{$smarty.const._MD_TADDISCUS_BOARD_EMPTY}></a>
  </div>

<{/if}>

<{include file="db:system_notification_select.html"}>