<r:require module="filterpane" />
<a href="#list-entrada" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>				
				<sec:noAccess expression="hasRole('ROLE_FARMACIA_LECTURA')">
					<li>
						<a href="#" onclick="nuevaVentana('/almacenWeb/${controllerName}/create')" class="create">
							<g:message code="default.new.label" args="[entityName]" />
						</a>
					</li>
				</sec:noAccess>
				
				<li><a class="home" href="${createLink(action: 'list')}">
				<g:message code="default.refresh.label"/></a>
				</li>
			</ul>
		</div>
		<div id="list-entrada" class="content scaffold-list" role="main">
			<h1>
			
			<g:almacenDescripcion code="default.list.entrada.label" almacen="${almacen}"/>
			
			
			</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>					
						<g:sortableColumn property="folio" title="Folio" />					
						<g:sortableColumn property="fecha" title="Fecha" />
						
						<g:if test="${almacen == 'F'}">					
							<g:sortableColumn property="idSalAlma" title="Almacen" />
							<g:sortableColumn property="numeroFactura" title="Remision" />
						</g:if>
						<g:else>
							<g:sortableColumn property="tipoVale" title="Tipo" />						
						</g:else>											
						
						<g:sortableColumn property="usuario" title="Registro" />
						
						<g:if test="${almacen != 'F'}">
							<g:sortableColumn property="paqueteq" title="Paquete" />
							<g:sortableColumn property="area" title="Area" />						
						</g:if>
						
						<g:sortableColumn property="estado" title="Estado" />					
					</tr>
				</thead>
				<tbody>
				<g:each in="${entradaInstanceList}" status="i" var="entradaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: entradaInstance, field: "folio")}</td>					
						<td>
							<a href="#" onclick="nuevaVentana('/almacenWeb/${controllerName}/create/${entradaInstance.id}')">
								<g:formatDate date="${entradaInstance.fecha}" format="dd/MM/yyyy" />
							</a>						
						</td>	
							
						<g:if test="${almacen == 'F'}">										
							<td>${fieldValue(bean: entradaInstance, field: "folioAlmacen")}</td>
							<td>${fieldValue(bean: entradaInstance, field: "numeroFactura")}</td>
						</g:if>
						<g:else>
							<td>${fieldValue(bean: entradaInstance, field: "tipoVale")}</td>						
						</g:else>		
											
						<td>${fieldValue(bean: entradaInstance, field: "usuario")}</td>
						
						<g:if test="${almacen != 'F'}">
							<td>${fieldValue(bean: entradaInstance, field: "paqueteq")}</td>					
							<td>${fieldValue(bean: entradaInstance, field: "area")}</td>						
						</g:if>
						
						
						<td>${fieldValue(bean: entradaInstance, field: "estado")=='A'?'ACTIVO':'CANCELADO'}</td>
						
						<g:if test="${entradaInstance?.estado == 'C' && (entradaInstance?.dueno || isAdmin)}" >
							<td><g:link action="eliminar" id="${entradaInstance.id}" onclick="return confirm('Esta seguro de eliminar la entrada?');">Eliminar</g:link></td>
						</g:if>					
											
					</tr>
				</g:each>
				</tbody>
			</table>			
		</div>