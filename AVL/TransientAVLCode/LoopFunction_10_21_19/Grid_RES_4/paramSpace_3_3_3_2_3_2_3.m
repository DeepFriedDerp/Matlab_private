function [aeroForces] = paramSpace_3_3_3_2_3_2_3(sailStates,airStates)

	CL = (3.967748)*sailStates.alpha + (-0.020030)*sailStates.beta + (-2.976463)*sailStates.p + (38.193493)*sailStates.q + (0.190034)*sailStates.r + (0.011228)*sailStates.de;
	CD = 0.029940;
	CY = (0.078973)*sailStates.alpha + (-0.025238)*sailStates.beta + (-0.024925)*sailStates.p + (0.668511)*sailStates.q + (0.001657)*sailStates.r + (0.000145)*sailStates.de;

	Cl = (1.349286)*sailStates.alpha + (-0.019144)*sailStates.beta + (-1.525025)*sailStates.p + (12.620463)*sailStates.q + (0.118715)*sailStates.r + (0.000852)*sailStates.de;
	Cm = (-14.400708)*sailStates.alpha + (0.084014)*sailStates.beta + (10.185846)*sailStates.p + (-148.601761)*sailStates.q + (-0.663552)*sailStates.r + (-0.071270)*sailStates.de;
	Cn = (-0.157500)*sailStates.alpha + (0.001505)*sailStates.beta + (0.129520)*sailStates.p + (-1.449594)*sailStates.q + (-0.009784)*sailStates.r + (-0.000208)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end