function [aeroForces] = paramSpace_4_2_1_1_2_1_3(sailStates,airStates)

	CL = (5.476202)*sailStates.alpha + (-0.100497)*sailStates.beta + (-3.163776)*sailStates.p + (34.540581)*sailStates.q + (-0.937305)*sailStates.r + (0.009630)*sailStates.de;
	CD = -1.961660;
	CY = (-0.347393)*sailStates.alpha + (-0.025612)*sailStates.beta + (-0.727138)*sailStates.p + (-0.662189)*sailStates.q + (0.144708)*sailStates.r + (-0.000143)*sailStates.de;

	Cl = (1.789265)*sailStates.alpha + (0.371894)*sailStates.beta + (-1.825299)*sailStates.p + (14.744817)*sailStates.q + (-1.163805)*sailStates.r + (0.001522)*sailStates.de;
	Cm = (-15.363387)*sailStates.alpha + (0.434802)*sailStates.beta + (12.413307)*sailStates.p + (-158.727341)*sailStates.q + (3.034959)*sailStates.r + (-0.070277)*sailStates.de;
	Cn = (0.648670)*sailStates.alpha + (-0.082258)*sailStates.beta + (1.995565)*sailStates.p + (-9.730090)*sailStates.q + (-0.093740)*sailStates.r + (0.000028)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end