function [aeroForces] = paramSpace_1_2_1_1_1_1_1(sailStates,airStates)

	CL = (5.333669)*sailStates.alpha + (0.000000)*sailStates.beta + (-1.838303)*sailStates.p + (34.872841)*sailStates.q + (-2.399782)*sailStates.r + (0.011651)*sailStates.de;
	CD = -1.827540;
	CY = (0.020517)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.893065)*sailStates.p + (-2.260754)*sailStates.q + (-0.157257)*sailStates.r + (-0.000475)*sailStates.de;

	Cl = (0.543058)*sailStates.alpha + (0.536695)*sailStates.beta + (-0.544907)*sailStates.p + (4.947467)*sailStates.q + (-2.118468)*sailStates.r + (-0.000686)*sailStates.de;
	Cm = (-8.880492)*sailStates.alpha + (-0.000000)*sailStates.beta + (4.706064)*sailStates.p + (-113.665031)*sailStates.q + (8.035042)*sailStates.r + (-0.066352)*sailStates.de;
	Cn = (-1.419068)*sailStates.alpha + (0.094634)*sailStates.beta + (2.022867)*sailStates.p + (-7.250126)*sailStates.q + (-0.000529)*sailStates.r + (0.000510)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end