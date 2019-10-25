function [aeroForces] = paramSpace_1_3_3_1_2_1_3(sailStates,airStates)

	CL = (6.155478)*sailStates.alpha + (0.637577)*sailStates.beta + (-3.498708)*sailStates.p + (49.247841)*sailStates.q + (-3.412115)*sailStates.r + (0.012579)*sailStates.de;
	CD = -2.399930;
	CY = (-0.406063)*sailStates.alpha + (-0.023492)*sailStates.beta + (-1.307644)*sailStates.p + (0.589409)*sailStates.q + (-0.230517)*sailStates.r + (0.000127)*sailStates.de;

	Cl = (2.018652)*sailStates.alpha + (0.828802)*sailStates.beta + (-1.877945)*sailStates.p + (17.882135)*sailStates.q + (-2.897243)*sailStates.r + (0.001364)*sailStates.de;
	Cm = (-10.639606)*sailStates.alpha + (-2.335169)*sailStates.beta + (9.762204)*sailStates.p + (-158.590927)*sailStates.q + (11.320191)*sailStates.r + (-0.070050)*sailStates.de;
	Cn = (1.708717)*sailStates.alpha + (0.105420)*sailStates.beta + (2.671502)*sailStates.p + (-11.410479)*sailStates.q + (0.018348)*sailStates.r + (-0.000462)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end