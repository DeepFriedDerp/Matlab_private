function [aeroForces] = paramSpace_4_2_2_3_3_3_3(sailStates,airStates)

	CL = (4.031226)*sailStates.alpha + (0.115361)*sailStates.beta + (-2.795599)*sailStates.p + (39.643173)*sailStates.q + (1.618747)*sailStates.r + (0.011272)*sailStates.de;
	CD = -0.129010;
	CY = (0.091827)*sailStates.alpha + (-0.024673)*sailStates.beta + (0.470614)*sailStates.p + (0.294833)*sailStates.q + (-0.093622)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.296930)*sailStates.alpha + (-0.210593)*sailStates.beta + (-1.409599)*sailStates.p + (12.675347)*sailStates.q + (1.261590)*sailStates.r + (0.000742)*sailStates.de;
	Cm = (-12.690536)*sailStates.alpha + (-0.417721)*sailStates.beta + (8.721433)*sailStates.p + (-142.570129)*sailStates.q + (-5.392704)*sailStates.r + (-0.068480)*sailStates.de;
	Cn = (-0.326413)*sailStates.alpha + (0.048174)*sailStates.beta + (-0.843413)*sailStates.p + (2.664505)*sailStates.q + (-0.027418)*sailStates.r + (0.000002)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end