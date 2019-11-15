function [aeroForces] = paramSpace_2_3_1_2_3_3_1(sailStates,airStates)

	CL = (4.215057)*sailStates.alpha + (-0.037817)*sailStates.beta + (-2.130079)*sailStates.p + (30.569893)*sailStates.q + (0.515365)*sailStates.r + (0.010566)*sailStates.de;
	CD = -0.286510;
	CY = (0.036670)*sailStates.alpha + (-0.024667)*sailStates.beta + (0.270867)*sailStates.p + (0.668510)*sailStates.q + (0.017683)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (0.976043)*sailStates.alpha + (-0.174398)*sailStates.beta + (-0.849847)*sailStates.p + (6.231537)*sailStates.q + (0.560113)*sailStates.r + (-0.000243)*sailStates.de;
	Cm = (-14.669621)*sailStates.alpha + (0.132219)*sailStates.beta + (7.545240)*sailStates.p + (-125.787453)*sailStates.q + (-1.726280)*sailStates.r + (-0.068952)*sailStates.de;
	Cn = (0.318457)*sailStates.alpha + (-0.010454)*sailStates.beta + (-0.691400)*sailStates.p + (2.900895)*sailStates.q + (-0.005075)*sailStates.r + (-0.000122)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end