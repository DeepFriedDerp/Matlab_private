function [aeroForces] = paramSpace_2_3_4_3_2_3_3(sailStates,airStates)

	CL = (4.207452)*sailStates.alpha + (-0.036902)*sailStates.beta + (-2.810274)*sailStates.p + (36.271549)*sailStates.q + (0.298575)*sailStates.r + (0.011058)*sailStates.de;
	CD = -0.156900;
	CY = (0.034478)*sailStates.alpha + (-0.024960)*sailStates.beta + (0.244723)*sailStates.p + (0.065300)*sailStates.q + (0.016047)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.361876)*sailStates.alpha + (-0.131391)*sailStates.beta + (-1.399107)*sailStates.p + (11.350051)*sailStates.q + (0.391281)*sailStates.r + (0.000645)*sailStates.de;
	Cm = (-14.948021)*sailStates.alpha + (0.178898)*sailStates.beta + (9.775565)*sailStates.p + (-144.341232)*sailStates.q + (-1.046762)*sailStates.r + (-0.070808)*sailStates.de;
	Cn = (0.051205)*sailStates.alpha + (-0.007739)*sailStates.beta + (-0.615059)*sailStates.p + (2.899920)*sailStates.q + (-0.008980)*sailStates.r + (0.000015)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end