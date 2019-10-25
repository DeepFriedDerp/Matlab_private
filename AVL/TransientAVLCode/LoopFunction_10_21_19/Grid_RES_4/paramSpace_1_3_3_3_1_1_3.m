function [aeroForces] = paramSpace_1_3_3_3_1_1_3(sailStates,airStates)

	CL = (4.031226)*sailStates.alpha + (0.115361)*sailStates.beta + (-2.795599)*sailStates.p + (39.643173)*sailStates.q + (-1.618748)*sailStates.r + (0.011272)*sailStates.de;
	CD = -0.129010;
	CY = (-0.091827)*sailStates.alpha + (-0.025280)*sailStates.beta + (-0.470614)*sailStates.p + (-0.294833)*sailStates.q + (-0.093622)*sailStates.r + (-0.000063)*sailStates.de;

	Cl = (1.256272)*sailStates.alpha + (0.282570)*sailStates.beta + (-1.378055)*sailStates.p + (12.278384)*sailStates.q + (-1.255330)*sailStates.r + (0.000656)*sailStates.de;
	Cm = (-12.690537)*sailStates.alpha + (-0.417721)*sailStates.beta + (8.721432)*sailStates.p + (-142.570129)*sailStates.q + (5.392705)*sailStates.r + (-0.068480)*sailStates.de;
	Cn = (0.295923)*sailStates.alpha + (0.049922)*sailStates.beta + (0.849688)*sailStates.p + (-2.743466)*sailStates.q + (-0.026173)*sailStates.r + (-0.000002)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end