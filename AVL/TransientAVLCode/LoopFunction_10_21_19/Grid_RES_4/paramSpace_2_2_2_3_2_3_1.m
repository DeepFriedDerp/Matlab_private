function [aeroForces] = paramSpace_2_2_2_3_2_3_1(sailStates,airStates)

	CL = (4.182098)*sailStates.alpha + (0.025552)*sailStates.beta + (-2.289290)*sailStates.p + (32.087975)*sailStates.q + (0.348984)*sailStates.r + (0.010746)*sailStates.de;
	CD = -0.143590;
	CY = (-0.033507)*sailStates.alpha + (-0.024951)*sailStates.beta + (0.235824)*sailStates.p + (-0.065300)*sailStates.q + (0.015459)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.181877)*sailStates.alpha + (-0.107197)*sailStates.beta + (-1.006335)*sailStates.p + (7.810065)*sailStates.q + (0.396759)*sailStates.r + (0.000046)*sailStates.de;
	Cm = (-14.914927)*sailStates.alpha + (-0.097509)*sailStates.beta + (8.031272)*sailStates.p + (-130.047943)*sailStates.q + (-1.171730)*sailStates.r + (-0.069357)*sailStates.de;
	Cn = (0.267544)*sailStates.alpha + (-0.008008)*sailStates.beta + (-0.588320)*sailStates.p + (2.938097)*sailStates.q + (-0.008256)*sailStates.r + (0.000072)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end