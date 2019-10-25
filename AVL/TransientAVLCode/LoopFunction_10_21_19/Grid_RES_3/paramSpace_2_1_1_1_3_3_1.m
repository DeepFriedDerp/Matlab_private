function [aeroForces] = paramSpace_2_1_1_1_3_3_1(sailStates,airStates)

	CL = (5.156584)*sailStates.alpha + (0.380366)*sailStates.beta + (-1.673838)*sailStates.p + (27.570679)*sailStates.q + (1.764069)*sailStates.r + (0.010572)*sailStates.de;
	CD = -1.727070;
	CY = (-0.066451)*sailStates.alpha + (-0.025257)*sailStates.beta + (0.757656)*sailStates.p + (1.697131)*sailStates.q + (-0.000159)*sailStates.r + (0.000359)*sailStates.de;

	Cl = (0.599369)*sailStates.alpha + (-0.341150)*sailStates.beta + (-0.524688)*sailStates.p + (3.550639)*sailStates.q + (1.684148)*sailStates.r + (-0.000690)*sailStates.de;
	Cm = (-12.582496)*sailStates.alpha + (-1.464378)*sailStates.beta + (5.800461)*sailStates.p + (-112.341370)*sailStates.q + (-6.002930)*sailStates.r + (-0.067299)*sailStates.de;
	Cn = (1.330806)*sailStates.alpha + (0.000402)*sailStates.beta + (-1.767200)*sailStates.p + (6.914486)*sailStates.q + (0.000111)*sailStates.r + (-0.000352)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end