function [aeroForces] = paramSpace_1_2_3_1_3_2_2(sailStates,airStates)

	CL = (4.261284)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.459480)*sailStates.p + (35.429493)*sailStates.q + (-1.299124)*sailStates.r + (0.010847)*sailStates.de;
	CD = -0.045960;
	CY = (0.220677)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.445586)*sailStates.p + (1.671347)*sailStates.q + (-0.078410)*sailStates.r + (0.000355)*sailStates.de;

	Cl = (1.460851)*sailStates.alpha + (0.156110)*sailStates.beta + (-1.147669)*sailStates.p + (9.962942)*sailStates.q + (-0.925470)*sailStates.r + (0.000236)*sailStates.de;
	Cm = (-14.435652)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.818365)*sailStates.p + (-133.415192)*sailStates.q + (4.299591)*sailStates.r + (-0.068163)*sailStates.de;
	Cn = (-0.189671)*sailStates.alpha + (0.027526)*sailStates.beta + (0.803770)*sailStates.p + (-4.384890)*sailStates.q + (0.013755)*sailStates.r + (-0.000551)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end