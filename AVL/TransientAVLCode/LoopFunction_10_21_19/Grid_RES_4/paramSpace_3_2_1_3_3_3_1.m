function [aeroForces] = paramSpace_3_2_1_3_3_3_1(sailStates,airStates)

	CL = (4.188659)*sailStates.alpha + (0.055669)*sailStates.beta + (-2.328802)*sailStates.p + (33.589203)*sailStates.q + (0.809162)*sailStates.r + (0.011121)*sailStates.de;
	CD = -0.125510;
	CY = (0.042143)*sailStates.alpha + (-0.024835)*sailStates.beta + (0.270487)*sailStates.p + (0.563441)*sailStates.q + (-0.017788)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.142650)*sailStates.alpha + (-0.140471)*sailStates.beta + (-1.020457)*sailStates.p + (8.212173)*sailStates.q + (0.670442)*sailStates.r + (0.000057)*sailStates.de;
	Cm = (-14.343166)*sailStates.alpha + (-0.189551)*sailStates.beta + (7.804832)*sailStates.p + (-130.282166)*sailStates.q + (-2.721192)*sailStates.r + (-0.069379)*sailStates.de;
	Cn = (0.115989)*sailStates.alpha + (0.010388)*sailStates.beta + (-0.586927)*sailStates.p + (2.211109)*sailStates.q + (-0.001252)*sailStates.r + (-0.000099)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end