function [aeroForces] = paramSpace_13_1_1_1_2_1_1(sailStates,airStates)

	CL = (4.760285)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.945349)*sailStates.p + (26.787203)*sailStates.q + (-0.850318)*sailStates.r + (0.009834)*sailStates.de;
	CD = -0.838170;
	CY = (0.282108)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.629120)*sailStates.p + (1.304044)*sailStates.q + (0.110791)*sailStates.r + (0.000275)*sailStates.de;

	Cl = (1.291909)*sailStates.alpha + (0.262530)*sailStates.beta + (-0.756575)*sailStates.p + (4.883413)*sailStates.q + (-0.981282)*sailStates.r + (-0.000257)*sailStates.de;
	Cm = (-16.344345)*sailStates.alpha + (0.000000)*sailStates.beta + (7.763322)*sailStates.p + (-122.917580)*sailStates.q + (2.784509)*sailStates.r + (-0.067165)*sailStates.de;
	Cn = (-1.042560)*sailStates.alpha + (-0.046291)*sailStates.beta + (1.477744)*sailStates.p + (-7.780929)*sailStates.q + (-0.064151)*sailStates.r + (-0.000472)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end