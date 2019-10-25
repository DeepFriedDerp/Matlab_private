function [aeroForces] = paramSpace_3_1_4_2_1_2_2(sailStates,airStates)

	CL = (4.026022)*sailStates.alpha + (0.129049)*sailStates.beta + (-2.539022)*sailStates.p + (34.770031)*sailStates.q + (0.544922)*sailStates.r + (0.010827)*sailStates.de;
	CD = 0.024500;
	CY = (-0.096229)*sailStates.alpha + (-0.025851)*sailStates.beta + (0.221710)*sailStates.p + (-0.769434)*sailStates.q + (-0.014613)*sailStates.r + (-0.000165)*sailStates.de;

	Cl = (1.363508)*sailStates.alpha + (-0.042737)*sailStates.beta + (-1.242688)*sailStates.p + (10.330973)*sailStates.q + (0.430051)*sailStates.r + (0.000451)*sailStates.de;
	Cm = (-14.428576)*sailStates.alpha + (-0.550183)*sailStates.beta + (8.596728)*sailStates.p + (-135.788696)*sailStates.q + (-1.867831)*sailStates.r + (-0.068965)*sailStates.de;
	Cn = (0.070651)*sailStates.alpha + (0.006165)*sailStates.beta + (-0.386190)*sailStates.p + (1.935797)*sailStates.q + (0.002312)*sailStates.r + (0.000233)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end