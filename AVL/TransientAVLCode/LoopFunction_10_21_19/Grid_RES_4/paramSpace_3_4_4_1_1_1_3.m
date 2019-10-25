function [aeroForces] = paramSpace_3_4_4_1_1_1_3(sailStates,airStates)

	CL = (5.005298)*sailStates.alpha + (0.339385)*sailStates.beta + (-3.356326)*sailStates.p + (39.330044)*sailStates.q + (-1.317725)*sailStates.r + (0.010741)*sailStates.de;
	CD = -1.631730;
	CY = (-0.463950)*sailStates.alpha + (-0.022135)*sailStates.beta + (-0.642648)*sailStates.p + (-1.915493)*sailStates.q + (0.041919)*sailStates.r + (-0.000416)*sailStates.de;

	Cl = (1.246426)*sailStates.alpha + (0.477277)*sailStates.beta + (-1.843536)*sailStates.p + (15.142859)*sailStates.q + (-1.362327)*sailStates.r + (0.001345)*sailStates.de;
	Cm = (-13.044883)*sailStates.alpha + (-1.310699)*sailStates.beta + (11.936881)*sailStates.p + (-159.650192)*sailStates.q + (4.456545)*sailStates.r + (-0.071570)*sailStates.de;
	Cn = (0.881357)*sailStates.alpha + (-0.024894)*sailStates.beta + (1.631528)*sailStates.p + (-6.562958)*sailStates.q + (-0.009614)*sailStates.r + (0.000359)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end