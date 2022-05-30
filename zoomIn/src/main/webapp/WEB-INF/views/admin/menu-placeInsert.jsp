<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>




<div class="row" style="margin-bottom: 20px; margin-left: 1px;">
	<div class="col-lg-12">
		<h3 class="page-header">등록 페이지</h3>
	</div>
</div>

<div class="panel" style="margin-left: 1px;">
	<div id="contAreaBox">
		<div class="panel">
			<div class="panel-body">
				<form method="post" action="actionPlaceInsert" name="PlaceBean"
					accept-charset="utf-8">
					<div class="table-responsive" style="text-align: center;">

						<table id="datatable-scroller"
							class="table table-bordered tbl_Form">
							<caption></caption>
							<colgroup>
								<col width="250px" />
								<col />
							</colgroup>
							<tbody>


								<tr>

									<th class="active">이름</th>
									<td class="form-inline"><input type="text" id="place_name"
										name="place_name" class="form-control" style="width: 200px" />
									</td>
								</tr>
								<tr>
									<th class="active">주소</th>
									<td class="form-inline"><input type="text"
										id="place_address" name="place_address" class="form-control"
										style="width: 440px" /></td>
								</tr>
								<tr>
									<th class="active">전화번호</th>
									<td class="form-inline"><input type="text" id="place_tell"
										name="place_tell" class="form-control" style="width: 200px" />
									</td>
								</tr>
								<tr>
									<th class="active">영업시간</th>
									<td class="form-inline"><input type="text"
										id="place_business_hours" name="place_business_hours"
										class="form-control" style="width: 340px" /></td>
								</tr>
								<tr>
									<th class="active">업종</th>
									<td class="form-inline"><input type="text"
										id="category_name" name="category_name" class="form-control"
										style="width: 100px" /></td>
								</tr>
								<tr>
									<th class="active">설명</th>
									<td class="form-inline"><textarea id="place_description"
											name="place_description" cols="100" rows="10"
											class="form-control"></textarea></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div align="center" style="border: 1px; height: 100px;">
						<button type="submit" class="btn btn-outline-success">등록</button>
						<button type="reset" class="btn btn-outline-danger">취소</button>
						
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

