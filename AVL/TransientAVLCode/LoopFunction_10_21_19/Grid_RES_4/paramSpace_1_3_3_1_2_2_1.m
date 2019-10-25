function [aeroForces] = paramSpace_1_3_3_1_2_2_1(sailStates,airStates)

	CL = (3.613643)*sailStates.alpha + (0.049626)*sailStates.beta + (-1.628168)*sailStates.p + (27.993532)*sailStates.q + (-0.639891)*sailStates.r + (0.010292)*sailStates.de;
	CD = 0.048720;
	CY = (-0.041202)*sailStates.alpha + (-0.025657)*sailStates.beta + (-0.109335)*sailStates.p + (-0.662188)*sailStates.q + (-0.021772)*sailStates.r + (-0.000138)*sailStates.de;

	Cl = (0.539953)*sailStates.alpha + (0.091257)*sailStates.beta + (-0.447899)*sailStates.p + (2.970159)*sailStates.q + (-0.382135)*sailStates.r + (-0.000819)*sailStates.de;
	Cm = (-12.908680)*sailStates.alpha + (-0.172878)*sailStates.beta + (5.423383)*sailStates.p + (-110.966957)*sailStates.q + (2.153877)*sailStates.r + (-0.065509)*sailStates.de;
	Cn = (-0.128311)*sailStates.alpha + (0.016646)*sailStates.beta + (0.220442)*sailStates.p + (-0.541192)*sailStates.q + (-0.014439)*sailStates.r + (0.000177)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end