function [aeroForces] = paramSpace_2_4_1_3_1_3_3(sailStates,airStates)

	CL = (4.154672)*sailStates.alpha + (-0.064225)*sailStates.beta + (-2.794950)*sailStates.p + (36.027695)*sailStates.q + (0.403906)*sailStates.r + (0.010800)*sailStates.de;
	CD = -0.168370;
	CY = (-0.022235)*sailStates.alpha + (-0.025385)*sailStates.beta + (0.280874)*sailStates.p + (-0.432842)*sailStates.q + (0.018455)*sailStates.r + (-0.000093)*sailStates.de;

	Cl = (1.352183)*sailStates.alpha + (-0.147692)*sailStates.beta + (-1.360126)*sailStates.p + (10.866783)*sailStates.q + (0.429200)*sailStates.r + (0.000562)*sailStates.de;
	Cm = (-14.643997)*sailStates.alpha + (0.186280)*sailStates.beta + (9.755685)*sailStates.p + (-143.531296)*sailStates.q + (-1.330662)*sailStates.r + (-0.069765)*sailStates.de;
	Cn = (0.128759)*sailStates.alpha + (-0.005530)*sailStates.beta + (-0.712673)*sailStates.p + (3.959427)*sailStates.q + (-0.013052)*sailStates.r + (0.000205)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end