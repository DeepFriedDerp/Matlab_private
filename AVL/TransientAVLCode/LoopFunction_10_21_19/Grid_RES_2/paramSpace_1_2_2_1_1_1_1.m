function [aeroForces] = paramSpace_1_2_2_1_1_1_1(sailStates,airStates)

	CL = (4.472481)*sailStates.alpha + (0.242619)*sailStates.beta + (-2.109535)*sailStates.p + (33.752613)*sailStates.q + (-1.556851)*sailStates.r + (0.011260)*sailStates.de;
	CD = -0.589870;
	CY = (-0.045259)*sailStates.alpha + (-0.026476)*sailStates.beta + (-0.539579)*sailStates.p + (-1.226114)*sailStates.q + (-0.071124)*sailStates.r + (-0.000260)*sailStates.de;

	Cl = (0.859277)*sailStates.alpha + (0.382591)*sailStates.beta + (-0.776821)*sailStates.p + (6.300701)*sailStates.q + (-1.312710)*sailStates.r + (-0.000361)*sailStates.de;
	Cm = (-12.529295)*sailStates.alpha + (-0.902129)*sailStates.beta + (6.511632)*sailStates.p + (-122.915771)*sailStates.q + (5.231098)*sailStates.r + (-0.067524)*sailStates.de;
	Cn = (-0.518020)*sailStates.alpha + (0.041585)*sailStates.beta + (1.189965)*sailStates.p + (-4.380655)*sailStates.q + (-0.002655)*sailStates.r + (0.000252)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end