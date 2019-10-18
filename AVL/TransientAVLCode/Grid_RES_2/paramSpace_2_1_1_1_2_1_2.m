function [aeroForces] = paramSpace_2_1_1_1_2_1_2(sailStates,airStates)

	CL = (6.112956)*sailStates.alpha + (-1.955222)*sailStates.beta + (-3.731069)*sailStates.p + (51.155331)*sailStates.q + (2.276984)*sailStates.r + (0.012928)*sailStates.de;
	CD = -6.191390;
	CY = (2.011954)*sailStates.alpha + (-0.123537)*sailStates.beta + (0.293064)*sailStates.p + (15.768073)*sailStates.q + (-0.032999)*sailStates.r + (0.003341)*sailStates.de;

	Cl = (-5.225534)*sailStates.alpha + (-1.058484)*sailStates.beta + (-1.898735)*sailStates.p + (16.467297)*sailStates.q + (2.478812)*sailStates.r + (0.001665)*sailStates.de;
	Cm = (3.457318)*sailStates.alpha + (8.593109)*sailStates.beta + (11.671135)*sailStates.p + (-165.710678)*sailStates.q + (-7.992819)*sailStates.r + (-0.068382)*sailStates.de;
	Cn = (-2.293145)*sailStates.alpha + (0.208160)*sailStates.beta + (-0.875953)*sailStates.p + (-9.010707)*sailStates.q + (-0.190384)*sailStates.r + (-0.004327)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end