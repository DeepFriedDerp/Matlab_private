function [aeroForces] = paramSpace_1_2_2_3_3_2_3(sailStates,airStates)

	CL = (3.954512)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.742654)*sailStates.p + (37.444668)*sailStates.q + (-1.097044)*sailStates.r + (0.010874)*sailStates.de;
	CD = 0.045500;
	CY = (0.051980)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.304423)*sailStates.p + (0.665000)*sailStates.q + (-0.053678)*sailStates.r + (0.000142)*sailStates.de;

	Cl = (1.362759)*sailStates.alpha + (0.125685)*sailStates.beta + (-1.373970)*sailStates.p + (11.890477)*sailStates.q + (-0.781795)*sailStates.r + (0.000642)*sailStates.de;
	Cm = (-13.879807)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.989918)*sailStates.p + (-141.960541)*sailStates.q + (3.676135)*sailStates.r + (-0.069034)*sailStates.de;
	Cn = (0.141809)*sailStates.alpha + (0.022162)*sailStates.beta + (0.459172)*sailStates.p + (-1.769781)*sailStates.q + (-0.014169)*sailStates.r + (-0.000230)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end