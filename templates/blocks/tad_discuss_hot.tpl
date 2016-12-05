<table summary="list_table"  cellspacing="1" class="table outer table">
  <tr>
    <th><{$smarty.const._MB_TADDISCUS_DISCUSSTITLE}></th>
    <th class="text-center"><{$smarty.const._MB_TADDISCUS_DISCUSSRE}></th>
    <th><{$smarty.const._MB_TADDISCUS_UID}></th>
    <th><{$smarty.const._MB_TADDISCUS_LAST_RE}></th>
  </tr>
  <tbody>

  <{foreach item=discuss from=$block.discuss}>
    <tr class="<{$discuss.class}>">
      <td>
        <img src="<{$xoops_url}>/modules/tad_discuss/images/<{if $discuss.isPublic}>greenpoint.gif<{else}>lock.png<{/if}>" alt="<{$discuss.DiscussTitle}>" title="<{$discuss.DiscussTitle}>" align="absmiddle" style="margin-right:3px;"><a href="<{$xoops_url}>/modules/tad_discuss/discuss.php?DiscussID=<{$discuss.DiscussID}>&BoardID=<{$discuss.BoardID}>" style="color:#505050"><{$discuss.showDiscussTitle}></a>
      </td>
      <td class="text-center">
        <{$discuss.renum}>
      </td>
      <td>
        <div style="font-size:10px;"><{$discuss.DiscussDate}></div>
        <div><{$discuss.uid_name}></div>
      </td>
      <td>
        <div style="font-size:10px;"><{$discuss.LastTime}></div>
        <div><{$discuss.last_uid_name}></div>
      </td>
    </tr>
  <{/foreach}>

  </tbody>
</table>
