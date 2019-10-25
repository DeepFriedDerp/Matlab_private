function [aeroForces] = paramSpace_1_3_1_3_2_1_1(sailStates,airStates)

	CL = (4.112690)*sailStates.alpha + (0.312108)*sailStates.beta + (-2.276735)*sailStates.p + (35.004436)*sailStates.q + (-1.454723)*sailStates.r + (0.010791)*sailStates.de;
	CD = -0.179520;
	CY = (0.031901)*sailStates.alpha + (-0.025311)*sailStates.beta + (-0.492852)*sailStates.p + (-0.173374)*sailStates.q + (-0.086887)*sailStates.r + (-0.000037)*sailStates.de;

	Cl = (1.095550)*sailStates.alpha + (0.331491)*sailStates.beta + (-0.930797)*sailStates.p + (7.861239)*sailStates.q + (-1.162849)*sailStates.r + (-0.000113)*sailStates.de;
	Cm = (-12.641020)*sailStates.alpha + (-1.229266)*sailStates.beta + (7.040913)*sailStates.p + (-127.559647)*sailStates.q + (4.889802)*sailStates.r + (-0.066767)*sailStates.de;
	Cn = (-0.262118)*sailStates.alpha + (0.043699)*sailStates.beta + (0.977580)*sailStates.p + (-3.772305)*sailStates.q + (-0.003988)*sailStates.r + (-0.000012)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end