function [aeroForces] = paramSpace_3_2_1_3_2_1_3(sailStates,airStates)

	CL = (4.207452)*sailStates.alpha + (-0.036902)*sailStates.beta + (-2.810275)*sailStates.p + (36.271549)*sailStates.q + (-0.298575)*sailStates.r + (0.011058)*sailStates.de;
	CD = -0.156900;
	CY = (-0.034478)*sailStates.alpha + (-0.024993)*sailStates.beta + (-0.244723)*sailStates.p + (-0.065300)*sailStates.q + (0.016047)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.409462)*sailStates.alpha + (0.118474)*sailStates.beta + (-1.431759)*sailStates.p + (11.753928)*sailStates.q + (-0.389183)*sailStates.r + (0.000733)*sailStates.de;
	Cm = (-14.948021)*sailStates.alpha + (0.178898)*sailStates.beta + (9.775566)*sailStates.p + (-144.341232)*sailStates.q + (1.046762)*sailStates.r + (-0.070808)*sailStates.de;
	Cn = (-0.043372)*sailStates.alpha + (-0.008638)*sailStates.beta + (0.617200)*sailStates.p + (-2.926391)*sailStates.q + (-0.009118)*sailStates.r + (-0.000015)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end