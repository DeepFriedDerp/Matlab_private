function [aeroForces] = paramSpace_2_4_3_1_3_2_3(sailStates,airStates)

	CL = (3.887012)*sailStates.alpha + (0.135460)*sailStates.beta + (-3.414944)*sailStates.p + (41.955837)*sailStates.q + (-0.884437)*sailStates.r + (0.011342)*sailStates.de;
	CD = -0.045050;
	CY = (0.103476)*sailStates.alpha + (-0.022945)*sailStates.beta + (-0.377181)*sailStates.p + (1.915492)*sailStates.q + (-0.024654)*sailStates.r + (0.000416)*sailStates.de;

	Cl = (1.493851)*sailStates.alpha + (0.169915)*sailStates.beta + (-1.862169)*sailStates.p + (15.843464)*sailStates.q + (-0.667679)*sailStates.r + (0.001345)*sailStates.de;
	Cm = (-13.704815)*sailStates.alpha + (-0.444740)*sailStates.beta + (11.450910)*sailStates.p + (-159.650192)*sailStates.q + (2.957956)*sailStates.r + (-0.071570)*sailStates.de;
	Cn = (0.201552)*sailStates.alpha + (0.005512)*sailStates.beta + (0.681565)*sailStates.p + (-4.126186)*sailStates.q + (0.008777)*sailStates.r + (-0.000623)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end