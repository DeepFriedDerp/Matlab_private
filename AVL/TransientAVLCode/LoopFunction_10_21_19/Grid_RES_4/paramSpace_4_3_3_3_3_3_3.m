function [aeroForces] = paramSpace_4_3_3_3_3_3_3(sailStates,airStates)

	CL = (3.998476)*sailStates.alpha + (-0.122391)*sailStates.beta + (-2.794794)*sailStates.p + (39.692032)*sailStates.q + (1.627743)*sailStates.r + (0.011183)*sailStates.de;
	CD = -0.124880;
	CY = (0.093453)*sailStates.alpha + (-0.025300)*sailStates.beta + (0.485156)*sailStates.p + (0.294834)*sailStates.q + (-0.096493)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.252818)*sailStates.alpha + (-0.290151)*sailStates.beta + (-1.377682)*sailStates.p + (12.280597)*sailStates.q + (1.279048)*sailStates.r + (0.000656)*sailStates.de;
	Cm = (-12.485758)*sailStates.alpha + (0.462302)*sailStates.beta + (8.711164)*sailStates.p + (-142.570129)*sailStates.q + (-5.444324)*sailStates.r + (-0.068480)*sailStates.de;
	Cn = (-0.301534)*sailStates.alpha + (0.051422)*sailStates.beta + (-0.871612)*sailStates.p + (2.754590)*sailStates.q + (-0.026588)*sailStates.r + (-0.000010)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end