function [aeroForces] = paramSpace_1_3_2_2_2_1_2(sailStates,airStates)

	CL = (4.508960)*sailStates.alpha + (0.151617)*sailStates.beta + (-2.556983)*sailStates.p + (38.908730)*sailStates.q + (-2.013463)*sailStates.r + (0.011305)*sailStates.de;
	CD = -0.489340;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.697602)*sailStates.p + (-0.000001)*sailStates.q + (-0.138762)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.374353)*sailStates.alpha + (0.391939)*sailStates.beta + (-1.171561)*sailStates.p + (10.660530)*sailStates.q + (-1.634435)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-12.207551)*sailStates.alpha + (-0.572955)*sailStates.beta + (7.497894)*sailStates.p + (-134.847153)*sailStates.q + (6.700539)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (-0.047014)*sailStates.alpha + (0.068778)*sailStates.beta + (1.388901)*sailStates.p + (-5.507379)*sailStates.q + (-0.002528)*sailStates.r + (-0.000110)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end