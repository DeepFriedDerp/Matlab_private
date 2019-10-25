function [aeroForces] = paramSpace_1_2_1_2_1_3_1(sailStates,airStates)

	CL = (4.280717)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.062171)*sailStates.p + (28.689911)*sailStates.q + (0.462924)*sailStates.r + (0.009830)*sailStates.de;
	CD = -0.419190;
	CY = (-0.189265)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.416861)*sailStates.p + (-1.027327)*sailStates.q + (0.073602)*sailStates.r + (-0.000217)*sailStates.de;

	Cl = (1.189044)*sailStates.alpha + (-0.167459)*sailStates.beta + (-0.844461)*sailStates.p + (5.949458)*sailStates.q + (0.585908)*sailStates.r + (-0.000133)*sailStates.de;
	Cm = (-15.289780)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.859703)*sailStates.p + (-125.588745)*sailStates.q + (-1.449111)*sailStates.r + (-0.067412)*sailStates.de;
	Cn = (0.705536)*sailStates.alpha + (-0.029528)*sailStates.beta + (-1.050899)*sailStates.p + (5.969639)*sailStates.q + (-0.056051)*sailStates.r + (0.000387)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end