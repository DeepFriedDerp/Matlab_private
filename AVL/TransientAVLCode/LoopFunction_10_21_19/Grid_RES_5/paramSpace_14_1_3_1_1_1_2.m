function [aeroForces] = paramSpace_14_1_3_1_1_1_2(sailStates,airStates)

	CL = (4.068672)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.823405)*sailStates.p + (34.881451)*sailStates.q + (0.208724)*sailStates.r + (0.009820)*sailStates.de;
	CD = -0.368950;
	CY = (-0.191908)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.134234)*sailStates.p + (-1.364607)*sailStates.q + (0.028483)*sailStates.r + (-0.000291)*sailStates.de;

	Cl = (1.321622)*sailStates.alpha + (0.121178)*sailStates.beta + (-1.506964)*sailStates.p + (12.590579)*sailStates.q + (-0.098533)*sailStates.r + (0.000915)*sailStates.de;
	Cm = (-14.516132)*sailStates.alpha + (0.000000)*sailStates.beta + (10.209426)*sailStates.p + (-146.890121)*sailStates.q + (-0.778013)*sailStates.r + (-0.068730)*sailStates.de;
	Cn = (-0.016268)*sailStates.alpha + (-0.025757)*sailStates.beta + (0.641473)*sailStates.p + (-3.036200)*sailStates.q + (-0.047256)*sailStates.r + (0.000323)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end