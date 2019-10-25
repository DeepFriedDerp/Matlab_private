function [aeroForces] = paramSpace_3_4_2_3_3_2_3(sailStates,airStates)

	CL = (3.960248)*sailStates.alpha + (-0.044978)*sailStates.beta + (-2.812509)*sailStates.p + (36.775509)*sailStates.q + (0.230473)*sailStates.r + (0.011017)*sailStates.de;
	CD = 0.028890;
	CY = (0.053274)*sailStates.alpha + (-0.025202)*sailStates.beta + (-0.002409)*sailStates.p + (0.432842)*sailStates.q + (0.000143)*sailStates.r + (0.000093)*sailStates.de;

	Cl = (1.252820)*sailStates.alpha + (-0.031180)*sailStates.beta + (-1.365764)*sailStates.p + (11.071452)*sailStates.q + (0.133367)*sailStates.r + (0.000562)*sailStates.de;
	Cm = (-14.384795)*sailStates.alpha + (0.136612)*sailStates.beta + (9.617651)*sailStates.p + (-143.531296)*sailStates.q + (-0.775326)*sailStates.r + (-0.069765)*sailStates.de;
	Cn = (-0.118650)*sailStates.alpha + (0.002048)*sailStates.beta + (0.064477)*sailStates.p + (-0.836777)*sailStates.q + (-0.007110)*sailStates.r + (-0.000121)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end