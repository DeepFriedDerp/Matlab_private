function [aeroForces] = paramSpace_6_1_1_1_1_2_2(sailStates,airStates)

	CL = (4.887244)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.051936)*sailStates.p + (37.476864)*sailStates.q + (1.095113)*sailStates.r + (0.010933)*sailStates.de;
	CD = -0.839580;
	CY = (0.034699)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.637749)*sailStates.p + (-0.839976)*sailStates.q + (0.044684)*sailStates.r + (-0.000183)*sailStates.de;

	Cl = (1.822019)*sailStates.alpha + (-0.284937)*sailStates.beta + (-1.620062)*sailStates.p + (13.217857)*sailStates.q + (1.068324)*sailStates.r + (0.001048)*sailStates.de;
	Cm = (-15.212557)*sailStates.alpha + (0.000000)*sailStates.beta + (10.873701)*sailStates.p + (-151.784744)*sailStates.q + (-3.663972)*sailStates.r + (-0.071706)*sailStates.de;
	Cn = (-0.107570)*sailStates.alpha + (-0.019925)*sailStates.beta + (-1.525494)*sailStates.p + (8.067663)*sailStates.q + (-0.024403)*sailStates.r + (0.000404)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end