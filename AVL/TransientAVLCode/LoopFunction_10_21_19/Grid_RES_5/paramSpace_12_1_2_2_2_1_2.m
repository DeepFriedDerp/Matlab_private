function [aeroForces] = paramSpace_12_1_2_2_2_1_2(sailStates,airStates)

	CL = (4.068049)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.720178)*sailStates.p + (35.454369)*sailStates.q + (0.117443)*sailStates.r + (0.010744)*sailStates.de;
	CD = -0.081350;
	CY = (0.022308)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.146183)*sailStates.p + (0.291853)*sailStates.q + (0.020534)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.345947)*sailStates.alpha + (0.061384)*sailStates.beta + (-1.357517)*sailStates.p + (11.098630)*sailStates.q + (-0.067200)*sailStates.r + (0.000638)*sailStates.de;
	Cm = (-14.833356)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.552812)*sailStates.p + (-142.523422)*sailStates.q + (-0.409886)*sailStates.r + (-0.069778)*sailStates.de;
	Cn = (-0.195739)*sailStates.alpha + (-0.008627)*sailStates.beta + (0.483086)*sailStates.p + (-2.970378)*sailStates.q + (-0.031662)*sailStates.r + (-0.000117)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end