function [aeroForces] = paramSpace_1_2_4_2_1_1_3(sailStates,airStates)

	CL = (4.203178)*sailStates.alpha + (-0.135515)*sailStates.beta + (-2.968407)*sailStates.p + (41.989021)*sailStates.q + (-1.957430)*sailStates.r + (0.011690)*sailStates.de;
	CD = -0.358190;
	CY = (-0.164962)*sailStates.alpha + (-0.024539)*sailStates.beta + (-0.596154)*sailStates.p + (-0.455226)*sailStates.q + (-0.118631)*sailStates.r + (-0.000097)*sailStates.de;

	Cl = (1.308799)*sailStates.alpha + (0.271995)*sailStates.beta + (-1.535791)*sailStates.p + (14.076461)*sailStates.q + (-1.561814)*sailStates.r + (0.000944)*sailStates.de;
	Cm = (-12.150939)*sailStates.alpha + (0.478126)*sailStates.beta + (9.028755)*sailStates.p + (-146.782669)*sailStates.q + (6.489473)*sailStates.r + (-0.068930)*sailStates.de;
	Cn = (0.534401)*sailStates.alpha + (0.062067)*sailStates.beta + (1.121810)*sailStates.p + (-3.764309)*sailStates.q + (-0.026939)*sailStates.r + (-0.000002)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end