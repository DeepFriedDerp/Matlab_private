function [aeroForces] = paramSpace_2_3_2_1_2_3_2(sailStates,airStates)

	CL = (6.199157)*sailStates.alpha + (-0.146289)*sailStates.beta + (-2.508560)*sailStates.p + (32.318100)*sailStates.q + (1.884201)*sailStates.r + (0.010490)*sailStates.de;
	CD = -2.184630;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.966889)*sailStates.p + (-0.000000)*sailStates.q + (0.063373)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.783038)*sailStates.alpha + (-0.524205)*sailStates.beta + (-1.173312)*sailStates.p + (8.882958)*sailStates.q + (1.839419)*sailStates.r + (0.000300)*sailStates.de;
	Cm = (-15.676355)*sailStates.alpha + (0.571882)*sailStates.beta + (9.248633)*sailStates.p + (-137.194580)*sailStates.q + (-6.376195)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (0.501252)*sailStates.alpha + (-0.030359)*sailStates.beta + (-2.243738)*sailStates.p + (10.460478)*sailStates.q + (-0.021458)*sailStates.r + (0.000196)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end