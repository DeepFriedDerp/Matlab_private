function [aeroForces] = paramSpace_3_2_3_3_2_1_2(sailStates,airStates)

	CL = (4.204098)*sailStates.alpha + (-0.023965)*sailStates.beta + (-2.549512)*sailStates.p + (34.196411)*sailStates.q + (-0.314623)*sailStates.r + (0.010868)*sailStates.de;
	CD = -0.141170;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.225232)*sailStates.p + (-0.000000)*sailStates.q + (0.014762)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.317723)*sailStates.alpha + (0.105673)*sailStates.beta + (-1.218915)*sailStates.p + (9.782748)*sailStates.q + (-0.368750)*sailStates.r + (0.000388)*sailStates.de;
	Cm = (-14.956079)*sailStates.alpha + (0.092080)*sailStates.beta + (8.899934)*sailStates.p + (-137.194580)*sailStates.q + (1.056070)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (-0.159648)*sailStates.alpha + (-0.007849)*sailStates.beta + (0.580550)*sailStates.p + (-2.920726)*sailStates.q + (-0.008666)*sailStates.r + (-0.000055)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end