function [aeroForces] = paramSpace_1_2_1_2_3_3_1(sailStates,airStates)

	CL = (3.917156)*sailStates.alpha + (-0.001275)*sailStates.beta + (-1.992363)*sailStates.p + (28.574055)*sailStates.q + (-0.012838)*sailStates.r + (0.009610)*sailStates.de;
	CD = -0.197910;
	CY = (0.027535)*sailStates.alpha + (-0.025508)*sailStates.beta + (0.153151)*sailStates.p + (0.455226)*sailStates.q + (0.030415)*sailStates.r + (0.000096)*sailStates.de;

	Cl = (0.974977)*sailStates.alpha + (-0.093183)*sailStates.beta + (-0.822051)*sailStates.p + (6.134187)*sailStates.q + (0.202035)*sailStates.r + (-0.000184)*sailStates.de;
	Cm = (-14.420693)*sailStates.alpha + (0.015866)*sailStates.beta + (7.316780)*sailStates.p + (-122.911674)*sailStates.q + (0.125986)*sailStates.r + (-0.066547)*sailStates.de;
	Cn = (0.307182)*sailStates.alpha + (-0.020066)*sailStates.beta + (-0.511660)*sailStates.p + (2.481243)*sailStates.q + (-0.029209)*sailStates.r + (-0.000071)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end