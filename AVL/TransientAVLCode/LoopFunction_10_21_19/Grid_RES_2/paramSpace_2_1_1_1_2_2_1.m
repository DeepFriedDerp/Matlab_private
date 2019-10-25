function [aeroForces] = paramSpace_2_1_1_1_2_2_1(sailStates,airStates)

	CL = (4.472482)*sailStates.alpha + (0.242619)*sailStates.beta + (-2.109535)*sailStates.p + (33.752613)*sailStates.q + (1.556851)*sailStates.r + (0.011260)*sailStates.de;
	CD = -0.589870;
	CY = (0.045259)*sailStates.alpha + (-0.023333)*sailStates.beta + (0.539579)*sailStates.p + (1.226114)*sailStates.q + (-0.071124)*sailStates.r + (0.000260)*sailStates.de;

	Cl = (0.963798)*sailStates.alpha + (-0.252022)*sailStates.beta + (-0.841227)*sailStates.p + (7.102501)*sailStates.q + (1.321133)*sailStates.r + (-0.000190)*sailStates.de;
	Cm = (-12.529294)*sailStates.alpha + (-0.902128)*sailStates.beta + (6.511632)*sailStates.p + (-122.915756)*sailStates.q + (-5.231096)*sailStates.r + (-0.067524)*sailStates.de;
	Cn = (0.447684)*sailStates.alpha + (0.041963)*sailStates.beta + (-1.181486)*sailStates.p + (4.275096)*sailStates.q + (-0.003764)*sailStates.r + (-0.000252)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end