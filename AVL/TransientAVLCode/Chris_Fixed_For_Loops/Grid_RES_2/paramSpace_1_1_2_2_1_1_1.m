function [aeroForces] = paramSpace_1_1_2_2_1_1_1(sailStates,airStates)

	CL = (4.700475)*sailStates.alpha + (0.561707)*sailStates.beta + (-5.254265)*sailStates.p + (50.775734)*sailStates.q + (1.761330)*sailStates.r + (0.010787)*sailStates.de;
	CD = -4.756260;
	CY = (1.672358)*sailStates.alpha + (-0.031013)*sailStates.beta + (1.046507)*sailStates.p + (3.244214)*sailStates.q + (0.138005)*sailStates.r + (0.000726)*sailStates.de;

	Cl = (-0.005710)*sailStates.alpha + (-0.552939)*sailStates.beta + (-3.572745)*sailStates.p + (30.932590)*sailStates.q + (1.954207)*sailStates.r + (0.004481)*sailStates.de;
	Cm = (-1.927925)*sailStates.alpha + (-2.363600)*sailStates.beta + (19.454292)*sailStates.p + (-215.560135)*sailStates.q + (-5.950860)*sailStates.r + (-0.078489)*sailStates.de;
	Cn = (-5.966009)*sailStates.alpha + (-0.095158)*sailStates.beta + (-2.905220)*sailStates.p + (12.660315)*sailStates.q + (-0.063873)*sailStates.r + (-0.000602)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end