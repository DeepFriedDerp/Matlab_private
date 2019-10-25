function [aeroForces] = paramSpace_2_3_1_2_3_1_3(sailStates,airStates)

	CL = (4.774867)*sailStates.alpha + (0.124587)*sailStates.beta + (-2.987025)*sailStates.p + (39.502811)*sailStates.q + (-1.610485)*sailStates.r + (0.011439)*sailStates.de;
	CD = -0.621770;
	CY = (-0.006827)*sailStates.alpha + (-0.024574)*sailStates.beta + (-0.715780)*sailStates.p + (0.870356)*sailStates.q + (-0.047007)*sailStates.r + (0.000189)*sailStates.de;

	Cl = (1.732221)*sailStates.alpha + (0.358166)*sailStates.beta + (-1.523582)*sailStates.p + (12.966946)*sailStates.q + (-1.415530)*sailStates.r + (0.000817)*sailStates.de;
	Cm = (-14.258155)*sailStates.alpha + (-0.502273)*sailStates.beta + (9.781431)*sailStates.p + (-147.878265)*sailStates.q + (5.480304)*sailStates.r + (-0.071191)*sailStates.de;
	Cn = (0.196538)*sailStates.alpha + (0.020245)*sailStates.beta + (1.474377)*sailStates.p + (-6.881968)*sailStates.q + (0.010215)*sailStates.r + (-0.000363)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end