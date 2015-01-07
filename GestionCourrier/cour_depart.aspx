﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="cour_depart.aspx.cs" Inherits="GestionCourrier.cour_departaspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header">
					<div class="pull-left">
						<h1>Courrier en départs</h1>
					</div>
					<div class="pull-right">
						
						<ul class="stats">
							<li class='lightred'>
								<i class="icon-calendar"></i>
								<div class="details">
									<span class="big">February 22, 2013</span>
									<span>Wednesday, 13:56</span>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="breadcrumbs">
					<ul>
						<li>
							<a href="index.aspx">Accueil</a>
							<i class="icon-angle-right"></i>
						</li>
						<li>
							<a href="#">Courriers</a>
							<i class="icon-angle-right"></i>
						</li>
						<li>
							<a href="#">Courriers Départs</a>
						</li>
					</ul>
					<div class="close-bread">
						<a href="#"><i class="icon-remove"></i></a>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<div class="box">
							<div class="box-title">
								<h3>
									<i class="icon-reorder"></i>
									Courrier Départs
								</h3>
							</div>
							<div class="box-content">
                                <%
                                    if(Session["type"] == "UA")
                                    {
                                %>
                                    <asp:Button ID="Button1" runat="server" Text="Ajouter un courrier" class="btn btn-primary" style="margin-bottom : 20px;" OnClick="Button_ajout_Click" />
							        
                                <%
                                    }
                                    
                                %>
                                
                                <table class="table table-hover table-nomargin table-bordered dataTable-columnfilter dataTable">
									<thead>
										<tr class='thefilter'>
											<th>Reference</th>
											<th>Dossier</th>
                                            <th>Type</th>
											<th class='hidden-350'>Nature</th>
											<th class='hidden-1024'>Date création</th>
											<th class='hidden-480'>Objet</th>
                                            <th>Agent UA</th>
                                            <th>Unité administrative</th>
                                            <th class="hidden-350">Réponse</th>
                                            <th>Etat</th>
                                            <th>Opérations</th>
										</tr>
										<tr>
											<th>Reference</th>
											<th>Dossier</th>
                                            <th>Type</th>
											<th class='hidden-350'>Nature</th>
											<th class='hidden-1024'>Date création</th>
											<th class='hidden-480'>Objet</th>
                                            <th>Agent UA</th>
                                            <th>Unité administrative</th>
                                            <th class="hidden-350">Réponse</th>
                                            <th>Etat</th>
                                            <th>Opérations</th>
										</tr>
									</thead>
									<tbody>
                                        <%
                                            List<GestionCourrier.Metier.CourrierDepart> liste;
                                                
                                             if(Session["type"].Equals("UA"))
                                             {
                                                 liste = GestionCourrier.Services.CourrierService.getCourriersDepart("depart", ((GestionCourrier.Metier.AgentUA)Session["user"]).getId());
                                             }
                                             else
                                             {
                                                 liste = GestionCourrier.Services.CourrierService.getCourriersDepart("depart");
                                             }
                                               
                                            foreach(GestionCourrier.Metier.CourrierDepart c in liste)
                                            {
                                        %>
                                        <tr>
                                            <td><% Response.Write(c.getReference()); %></td>
                                            <td><% Response.Write((c.getDossier()!=null)?c.getDossier().getReference():"Pas de dossier"); %></td>
                                            <td><% Response.Write(c.getTypecr()); %></td>
											<td><% Response.Write(c.getNature()); %></td>
											<td><% Response.Write(c.getDate_creation().ToString().Substring(0,10)); %></td>
											<td><% Response.Write(c.getObjet()); %></td>
                                            <td><% Response.Write(c.getAgentUA().getNom()+" "+c.getAgentUA().getPrenom()); %></td>
                                            <td><% Response.Write(c.getAgentUA().getUnite().getNom()); %></td>
                                            <td><% Response.Write((c.getReponse())?((c.getCourrier_Reponse()!=null)?c.getCourrier_Reponse().getReference():"En attente"):"Sans accusé"); %></td>
                                            <td><% Response.Write(c.getEtat()); %></td>
                                            <td style="text-align:center;" class='hidden-480'>
                                                <%if(Session["type"].Equals("UA") && c.getEtat().Equals("Cree"))
                                                  {
                                                  %>
                                                <a style="width:25px;" href="recevoir_courrier.aspx?ref=<% Response.Write(c.getReference()); %>" class="btn btn-success" rel="tooltip" title="Reçu"><i class="icon-check"></i></a><br />
												
                                                <%} %>
												<a style="width:25px;" href="details_courrier.aspx?ref=<% Response.Write(c.getReference()); %>" class="btn btn-info" rel="tooltip" title="Détails"><i class="icon-search"></i></a><br />
												<%if(Session["type"].Equals("BO"))
                                                  {
                                                  %>
                                                <a style="width:25px;" href="supprimer_courrier.aspx?ref=<% Response.Write(c.getReference()); %>" class="btn btn-danger" rel="tooltip" title="Supprimer"><i class="icon-remove"></i></a>
                                                <%} %>
											</td>
                                        </tr>
                                        <%} %>
                                    </tbody>
							    </table>
							</div>
						</div>
					</div>
				</div>
</asp:Content>
