function [aeroForces] = paramSpace_1_1_1_3_2_1_3(sailStates,airStates)

	CL = (4.093577)*sailStates.alpha + (-0.334391)*sailStates.beta + (-2.782381)*sailStates.p + (39.265404)*sailStates.q + (-1.635754)*sailStates.r + (0.011038)*sailStates.de;
	CD = -0.180800;
	CY = (-0.037873)*sailStates.alpha + (-0.025311)*sailStates.beta + (-0.548354)*sailStates.p + (0.173375)*sailStates.q + (-0.096706)*sailStates.r + (0.000037)*sailStates.de;

	Cl = (1.434236)*sailStates.alpha + (0.166768)*sailStates.beta + (-1.430079)*sailStates.p + (12.881259)*sailStates.q + (-1.325734)*sailStates.r + (0.000780)*sailStates.de;
	Cm = (-12.650834)*sailStates.alpha + (1.304979)*sailStates.beta + (8.686530)*sailStates.p + (-141.665955)*sailStates.q + (5.495874)*sailStates.r + (-0.068173)*sailStates.de;
	Cn = (0.283474)*sailStates.alpha + (0.046400)*sailStates.beta + (1.004785)*sailStates.p + (-3.676291)*sailStates.q + (-0.012345)*sailStates.r + (-0.000122)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end