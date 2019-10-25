function [aeroForces] = paramSpace_2_3_2_3_3_3_1(sailStates,airStates)

	CL = (4.125365)*sailStates.alpha + (-0.019524)*sailStates.beta + (-2.284277)*sailStates.p + (32.115479)*sailStates.q + (0.218873)*sailStates.r + (0.010746)*sailStates.de;
	CD = -0.103680;
	CY = (0.036650)*sailStates.alpha + (-0.024807)*sailStates.beta + (0.155290)*sailStates.p + (0.432841)*sailStates.q + (0.010163)*sailStates.r + (0.000093)*sailStates.de;

	Cl = (1.081672)*sailStates.alpha + (-0.100335)*sailStates.beta + (-0.970567)*sailStates.p + (7.414891)*sailStates.q + (0.292623)*sailStates.r + (-0.000052)*sailStates.de;
	Cm = (-14.808297)*sailStates.alpha + (0.076944)*sailStates.beta + (7.974091)*sailStates.p + (-129.813766)*sailStates.q + (-0.737399)*sailStates.r + (-0.069334)*sailStates.de;
	Cn = (0.160135)*sailStates.alpha + (-0.006045)*sailStates.beta + (-0.420800)*sailStates.p + (1.793092)*sailStates.q + (-0.004229)*sailStates.r + (-0.000084)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end