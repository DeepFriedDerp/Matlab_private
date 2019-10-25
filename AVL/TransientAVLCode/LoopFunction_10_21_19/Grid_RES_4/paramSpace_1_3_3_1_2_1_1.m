function [aeroForces] = paramSpace_1_3_3_1_2_1_1(sailStates,airStates)

	CL = (6.263789)*sailStates.alpha + (0.224193)*sailStates.beta + (-1.798178)*sailStates.p + (35.925640)*sailStates.q + (-2.891848)*sailStates.r + (0.011842)*sailStates.de;
	CD = -2.337600;
	CY = (0.336312)*sailStates.alpha + (-0.025657)*sailStates.beta + (-1.141357)*sailStates.p + (-0.662188)*sailStates.q + (-0.227054)*sailStates.r + (-0.000138)*sailStates.de;

	Cl = (1.295192)*sailStates.alpha + (0.655821)*sailStates.beta + (-0.501672)*sailStates.p + (5.064398)*sailStates.q + (-2.470659)*sailStates.r + (-0.000819)*sailStates.de;
	Cm = (-9.328321)*sailStates.alpha + (-0.840527)*sailStates.beta + (3.950836)*sailStates.p + (-110.966957)*sailStates.q + (9.556869)*sailStates.r + (-0.065509)*sailStates.de;
	Cn = (-2.028067)*sailStates.alpha + (0.115846)*sailStates.beta + (2.568596)*sailStates.p + (-11.069641)*sailStates.q + (0.039365)*sailStates.r + (0.000016)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end