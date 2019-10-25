function [aeroForces] = paramSpace_2_4_4_1_1_1_1(sailStates,airStates)

	CL = (5.239183)*sailStates.alpha + (0.477890)*sailStates.beta + (-1.737704)*sailStates.p + (30.076433)*sailStates.q + (-1.983433)*sailStates.r + (0.011053)*sailStates.de;
	CD = -1.756230;
	CY = (0.043531)*sailStates.alpha + (-0.026223)*sailStates.beta + (-0.793384)*sailStates.p + (-1.915493)*sailStates.q + (-0.052203)*sailStates.r + (-0.000404)*sailStates.de;

	Cl = (0.446896)*sailStates.alpha + (0.596889)*sailStates.beta + (-0.456374)*sailStates.p + (3.072782)*sailStates.q + (-1.812131)*sailStates.r + (-0.000891)*sailStates.de;
	Cm = (-11.467017)*sailStates.alpha + (-1.819257)*sailStates.beta + (5.441422)*sailStates.p + (-112.650780)*sailStates.q + (6.725470)*sailStates.r + (-0.066832)*sailStates.de;
	Cn = (-1.449285)*sailStates.alpha + (0.029446)*sailStates.beta + (1.840963)*sailStates.p + (-7.102503)*sailStates.q + (0.003977)*sailStates.r + (0.000409)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end