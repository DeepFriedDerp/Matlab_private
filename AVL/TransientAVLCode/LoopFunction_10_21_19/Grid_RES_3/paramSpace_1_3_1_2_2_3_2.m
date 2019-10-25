function [aeroForces] = paramSpace_1_3_1_2_2_3_2(sailStates,airStates)

	CL = (4.108997)*sailStates.alpha + (-0.024273)*sailStates.beta + (-2.415985)*sailStates.p + (31.855257)*sailStates.q + (0.133805)*sailStates.r + (0.009867)*sailStates.de;
	CD = -0.291570;
	CY = (-0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (0.254303)*sailStates.p + (0.000000)*sailStates.q + (0.044841)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.192909)*sailStates.alpha + (-0.135856)*sailStates.beta + (-1.102188)*sailStates.p + (8.446878)*sailStates.q + (0.323331)*sailStates.r + (0.000217)*sailStates.de;
	Cm = (-14.747263)*sailStates.alpha + (0.067126)*sailStates.beta + (8.843858)*sailStates.p + (-134.612778)*sailStates.q + (-0.365789)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (0.301932)*sailStates.alpha + (-0.016514)*sailStates.beta + (-0.758974)*sailStates.p + (4.087592)*sailStates.q + (-0.042720)*sailStates.r + (0.000079)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end