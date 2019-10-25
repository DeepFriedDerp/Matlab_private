function [aeroForces] = paramSpace_3_3_3_3_2_1_1(sailStates,airStates)

	CL = (4.182098)*sailStates.alpha + (0.025552)*sailStates.beta + (-2.289290)*sailStates.p + (32.087975)*sailStates.q + (-0.348984)*sailStates.r + (0.010746)*sailStates.de;
	CD = -0.143590;
	CY = (0.033507)*sailStates.alpha + (-0.025002)*sailStates.beta + (-0.235824)*sailStates.p + (0.065300)*sailStates.q + (0.015459)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.127407)*sailStates.alpha + (0.123287)*sailStates.beta + (-0.973687)*sailStates.p + (7.406189)*sailStates.q + (-0.398914)*sailStates.r + (-0.000041)*sailStates.de;
	Cm = (-14.914927)*sailStates.alpha + (-0.097509)*sailStates.beta + (8.031272)*sailStates.p + (-130.047943)*sailStates.q + (1.171731)*sailStates.r + (-0.069357)*sailStates.de;
	Cn = (-0.274074)*sailStates.alpha + (-0.007098)*sailStates.beta + (0.586181)*sailStates.p + (-2.911626)*sailStates.q + (-0.008114)*sailStates.r + (-0.000072)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end